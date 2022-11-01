import 'dart:async';

import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/exceptions.dart';
import '../../../domain/repository/auth/auth_repository.dart';
import '../../../domain/repository/auth/entity/auth_provider.dart';
import '../../../domain/repository/auth/entity/auth_user.dart';
import '../../../util/logger.dart';

/// Firebase認証リポジトリ
class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({
    required this.auth,
    this.firebaseUser,
  });

  final FirebaseAuth auth;
  final User? firebaseUser;

  @override
  AuthUser? getAuthUser() {
    return firebaseUser?.toAuthUser();
  }

  @override
  Future<AuthUser> loginAnonymously() async {
    assert(firebaseUser == null);
    final credential = await auth.signInAnonymously();
    return credential.user!.toAuthUser();
  }

  @override
  Future<void> logout() async {
    assert(firebaseUser != null);
    await auth.signOut();
  }

  @override
  Future<void> delete() async {
    assert(firebaseUser != null);
    try {
      await firebaseUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    }
  }

  @override
  String toString() {
    final user = firebaseUser;
    if (user == null) {
      return 'FirebaseUser(null)';
    }
    return 'FirebaseUser('
        'uid: ${user.uid}, '
        'isAnonymous: ${user.isAnonymous}'
        ')';
  }
}

extension FirebaseUserEx on User {
  /// FirebaseUser => AuthUser
  AuthUser toAuthUser() => AuthUser(
        uid: uid,
        provider: providerData.firstOrNull?.providerId.toAuthProvider() ??
            AuthProvider.anonymous,
      );
}

extension _AuthProviderEx on String {
  /// String => AuthProvider
  AuthProvider toAuthProvider() {
    switch (this) {
      default:
        return AuthProvider.anonymous;
    }
  }
}

extension _FirebaseAuthExceptionEx on FirebaseAuthException {
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
