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

/// Firebaseユーザーリポジトリ
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    required this.auth,
    required this.firestore,
  }) {
    // 認証状態を監視する
    auth.userChanges().listen((firebaseUser) {
      logger.i(
        '$_logPrefix Received changed firebaseUser: uid = ${firebaseUser?.uid}',
      );
      _firebaseUser = firebaseUser;
      if (firebaseUser == null) {
        userChangesController.add(null);
        _cacheUser = null;
        logger.i('$_logPrefix Notified changes user: null');
        return;
      }

      // ユーザードキュメントを監視する
      docRef?.snapshots().listen((snapshot) {
        if (userChangesController.isClosed) {
          return;
        }

        final user = snapshot.data();
        if (user == _cacheUser) {
          // ユーザーに変更が無ければ通知しない
          return;
        }

        userChangesController.add(user);
        _cacheUser = user;
        logger.i('$_logPrefix Notified changes user: $user');
      });
    });
  }

  final firebase_auth.FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final userChangesController = StreamController<User?>.broadcast();
  firebase_auth.User? _firebaseUser;
  User? _cacheUser;
  bool _loggedIn = false;

  DocumentReference<User?>? get docRef {
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
          provider: AuthProvider.nameOf(userDoc.provider),
          createdPlatform: AppPlatform.nameOf(userDoc.createdPlatform),
          createdAt: userDoc.createdAt,
          updatedAt: userDoc.updatedAt,
        );
      },
      toFirestore: (user, options) {
        if (user == null) {
          return {};
        }

        final userDoc = UserDocument(
          provider: user.provider.name,
          createdPlatform: user.createdPlatform?.name,
          updatedAt: user.updatedAt,
        ).toJson();
        if (options?.merge == true) {
          // マージの場合、null は除外する
          userDoc.removeWhere((field, dynamic value) => value == null);
        }
        return userDoc;
      },
    ).doc(uid);
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

  void dispose() {
    userChangesController.close();
  }

  @override
  Future<void> loginAnonymously() async {
    assert(_firebaseUser == null);
    await auth.signInAnonymously();
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
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.toAuthException();
    }
  }

  @override
  Future<void> updateUser(UserInputData inputData) async {
    await docRef?.set(
      _cacheUser?.copyWith(
        createdPlatform: inputData.createdPlatform,
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
