import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../domain/entity/app_platform.dart';
import '../../../domain/repository/auth/entity/auth_provider.dart';
import '../../../domain/repository/user/entity/user.dart';
import '../../../domain/repository/user/user_repository.dart';
import 'documents/user_document.dart';

/// Firebaseユーザーリポジトリ
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
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

  final auth.User? firebaseUser;
  final DocumentReference<Map<String, dynamic>>? docRef;
  final changesController = StreamController<User?>.broadcast();

  @override
  Stream<User?> changes() => changesController.stream;

  void dispose() {
    changesController.close();
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
