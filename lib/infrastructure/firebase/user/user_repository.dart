import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../domain/entity/app_platform.dart';
import '../../../domain/exceptions.dart';
import '../../../domain/repository/user/entity/auth_provider.dart';
import '../../../domain/repository/user/entity/auth_user.dart';
import '../../../domain/repository/user/entity/user.dart';
import '../../../domain/repository/user/user_repository.dart';
import '../../../util/logger.dart';
import 'documents/user_document.dart';

/// Firebaseユーザーリポジトリ
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    required this.auth,
    this.firebaseUser,
    this.docRef,
  }) {
    docRef?.snapshots().listen((doc) {
      if (changesController.isClosed) {
        return;
      }
      changesController.add(doc.toUser());
    });
  }

  final firebase_auth.FirebaseAuth auth;
  final firebase_auth.User? firebaseUser;
  final DocumentReference<Map<String, dynamic>>? docRef;
  final changesController = StreamController<User?>.broadcast();

  @override
  Stream<User?> changes() => changesController.stream;

  void dispose() {
    changesController.close();
  }

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
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.toAuthException();
    }
  }

  @override
  Future<User?> get() async {
    final doc = await docRef?.get();
    return doc?.toUser();
  }
}

extension _DocDocumentSnapshotHelper on DocumentSnapshot<Map<String, dynamic>> {
  User? toUser() {
    final json = data();
    if (json == null) {
      return null;
    }
    final userDoc = UserDocument.fromJson(json);
    return User(
      uid: id,
      provider: AuthProvider.nameOf(userDoc.provider),
      createdPlatform: AppPlatform.nameOf(userDoc.createdPlatform),
      createdAt: userDoc.createdAt,
      updatedAt: userDoc.updatedAt,
    );
  }
}

extension FirebaseUserEx on firebase_auth.User {
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
