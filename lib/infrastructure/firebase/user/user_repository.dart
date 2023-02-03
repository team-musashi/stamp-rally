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
    required this.userColletionRef,
  }) {
    // 認証状態を監視する
    _authChangesSubscription = auth.userChanges().listen((firebaseUser) async {
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

        final user = snapshot.data()?.toUser(snapshot.id);
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
  final CollectionReference<Map<String, dynamic>> userColletionRef;
  final userChangesController = StreamController<User?>.broadcast();

  /// Firebase Auth の認証ユーザー
  firebase_auth.User? _firebaseUser;

  /// キャッシュされた最新のユーザー
  User? _cacheUser;

  /// ログイン済みかどうか
  bool? _loggedIn;

  /// 認証状態の監視をキャンセルするために保持
  StreamSubscription<firebase_auth.User?>? _authChangesSubscription;

  /// ユーザードキュメントの監視をキャンセルするために保持
  StreamSubscription<DocumentSnapshot<UserDocument?>>? _userChangesSubscription;

  /// ユーザードキュメントの参照を返す
  DocumentReference<UserDocument?>? get _docRef {
    final uid = _firebaseUser?.uid;
    if (uid == null) {
      return null;
    }

    return userColletionRef.withConverter<UserDocument?>(
      fromFirestore: (snapshot, _) {
        final json = snapshot.data();
        return json != null ? UserDocument.fromJson(json) : null;
      },
      toFirestore: (userDoc, options) {
        final json = userDoc?.toJson() ?? <String, dynamic>{};
        if (options?.merge ?? false) {
          // null で上書きされてしまうのでマージの場合は null は除外する
          json.removeWhere((field, dynamic value) => value == null);
        }
        return json;
      },
    ).doc(uid);
  }

  void dispose() {
    _authChangesSubscription?.cancel();
    _userChangesSubscription?.cancel();
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
  Future<User?> getUser() async {
    if (_cacheUser == null) {
      final snapshot = await _docRef?.get();
      _cacheUser = snapshot?.data()?.toUser(snapshot.id);
    }
    return _cacheUser;
  }

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
      await _firebaseUser?.delete();

      // ユーザードキュメントの削除は Firebase の extensionで行うので
      // ここでは削除しない
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.toAuthException();
    }
  }

  @override
  Future<void> updateUser(UserInputData inputData) async {
    await _docRef?.set(
      UserDocument(
        region: inputData.region,
        platform: inputData.platform?.name,
        updatedAt: DateTime.now(),
      ),
      SetOptions(merge: true),
    );
  }
}

extension _UserDocumentEx on UserDocument {
  /// UserDocument => User
  User toUser(String id) => User(
        uid: id,
        region: region,
        authProvider: AuthProvider.nameOf(authProvider),
        platform: AppPlatform.nameOf(platform),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
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
      case 'credential-already-in-use':
        return AuthException.emailAlreadyInUse();
      case 'user-mismatch':
        return AuthException.userMismatch();
      case 'invalid-action-code':
        return AuthException.invalidActionCode();
      case 'invalid-credential':
        return AuthException.invalidCredential();
      case 'requires-recent-login':
        return AuthException.requiresRecentLogin();
      case 'internal-error':
      case 'unknown':
        return AuthException.unknown();
      default:
        logger.w(this);
        return AuthException.unknown();
    }
  }
}
