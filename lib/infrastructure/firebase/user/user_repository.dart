import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../domain/entity/app_platform.dart';
import '../../../domain/exceptions.dart';
import '../../../domain/repository/user/entity/auth_provider.dart';
import '../../../domain/repository/user/entity/user.dart';
import '../../../domain/repository/user/entity/user_input_data.dart';
import '../../../domain/repository/user/user_repository.dart';
import '../../../util/logger.dart';
import 'document/user_document.dart';

const _logPrefix = '[USER]';

/// Firebase ユーザーリポジトリ
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    required this.auth,
    required this.firestore,
  }) {
    // 認証状態を監視する
    auth.userChanges().listen((firebaseUser) async {
      logger.i(
        '$_logPrefix Received changed firebaseUser: uid = ${firebaseUser?.uid}',
      );
      _firebaseUser = firebaseUser;
      if (firebaseUser == null) {
        // 認証ユーザーが削除された場合
        userChangesController.add(null);
        logger.i('$_logPrefix Notified changes user: null');
        _cacheUser = null;
        await _userChangesSubscription?.cancel();
        return;
      }

      // ユーザードキュメントを監視する
      _userChangesSubscription = _docRef?.snapshots().listen((snapshot) {
        if (userChangesController.isClosed) {
          return;
        }

        final user = snapshot.data();
        if (user == _cacheUser) {
          // ユーザーに変更が無ければ通知しない
          return;
        }

        userChangesController.add(user);
        logger.i('$_logPrefix Notified changes user: $user');
        _cacheUser = user;
      });
    });
  }

  final firebase_auth.FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final userChangesController = StreamController<User?>.broadcast();

  /// Firebase Auth の認証ユーザー
  firebase_auth.User? _firebaseUser;

  /// キャッシュされた最新のユーザー
  User? _cacheUser;

  /// ログイン済みかどうか
  bool _loggedIn = false;

  /// ユーザードキュメントの監視をキャンセルするために保持
  StreamSubscription<DocumentSnapshot<User?>>? _userChangesSubscription;

  /// ユーザードキュメントの参照を返す
  DocumentReference<User?>? get _docRef {
    final uid = _firebaseUser?.uid;
    if (uid == null) {
      return null;
    }

    return firestore.collection('user').withConverter<User?>(
      fromFirestore: (snapshot, _) {
        final json = snapshot.data();
        if (json == null) {
          return null;
        }

        final userDoc = UserDocument.fromJson(json);
        return User(
          uid: snapshot.id,
          authProvider: AuthProvider.nameOf(userDoc.authProvider),
          platform: AppPlatform.nameOf(userDoc.platform),
          createdAt: userDoc.createdAt,
          updatedAt: userDoc.updatedAt,
        );
      },
      toFirestore: (user, options) {
        if (user == null) {
          return {};
        }

        final json = UserDocument(
          authProvider: user.authProvider.name,
          platform: user.platform?.name,
          updatedAt: user.updatedAt,
        ).toJson();
        if (options?.merge == true) {
          // 除外しないと null で上書きされてしまうのでマージの場合は null は除外する
          json.removeWhere((field, dynamic value) => value == null);
        }
        return json;
      },
    ).doc(uid);
  }

  void dispose() {
    userChangesController.close();
  }

  @override
  Stream<bool> loggedInChanges() =>
      userChangesController.stream.map<bool>((user) => user != null).where(
        (loggedIn) {
          if (_loggedIn == loggedIn) {
            // ログイン状態に変更がなければ通知しない
            return false;
          }

          _loggedIn = loggedIn;
          logger.i('$_logPrefix Notified changes loggedIn: $_loggedIn');
          return true;
        },
      );

  @override
  Stream<User?> userChanges() => userChangesController.stream;

  @override
  Future<void> loginAnonymously() async {
    assert(_firebaseUser == null);
    try {
      await auth.signInAnonymously();
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.toAuthException();
    }
  }

  @override
  Future<void> logout() async {
    assert(_firebaseUser != null);
    await auth.signOut();
  }

  @override
  Future<void> deleteUser() async {
    assert(_firebaseUser != null);
    try {
      await _firebaseUser!.delete();

      // ユーザードキュメントの削除は Firebase の extensionで行うので
      // ここでは削除しない
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.toAuthException();
    }
  }

  @override
  Future<void> updateUser(UserInputData inputData) async {
    await _docRef?.set(
      _cacheUser?.copyWith(
        platform: inputData.platform,
      ),
      SetOptions(merge: true),
    );
  }
}

extension _FirebaseAuthExceptionEx on firebase_auth.FirebaseAuthException {
  /// FirebaseAuthException => AuthException
  AuthException toAuthException() {
    switch (code) {
      case 'invalid-email':
        return AuthException.invalidEmail();
      case 'wrong-password':
        return AuthException.wrongPassword();
      case 'weak-password':
        return AuthException.weakPassword();
      case 'user-not-found':
        return AuthException.userNotFound();
      case 'user-disabled':
        return AuthException.userDisabled();
      case 'too-many-requests':
        return AuthException.tooManyRequests();
      case 'operation-not-allowed':
        return AuthException.operationNotAllowed();
      case 'network-request-failed':
        return AuthException.networkRequestFailed();
      case 'email-already-in-use':
        return AuthException.emailAlreadyInUse();
      case 'user-mismatch':
        return AuthException.userMismatch();
      case 'invalid-action-code':
        return AuthException.invalidActionCode();
      case 'requires-recent-login':
        return AuthException.requiresRecentLogin();
      default:
        logger.w(this);
        return AuthException.unknown();
    }
  }
}
