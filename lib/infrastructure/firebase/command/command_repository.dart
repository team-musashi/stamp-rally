import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/repository/command/command_repository.dart';
import 'document/command_document.dart';

/// Firebase コマンドリポジトリ
class FirebaseCommandRepository implements CommandRepository {
  FirebaseCommandRepository({required this.store});

  final FirebaseFirestore store;

  static const commandCollectionName = 'command';

  @override
  Future<void> entryStampRally({
    required String? uid,
    required String stampRallyId,
  }) async {
    await store.collection(commandCollectionName).add(
          CommandDocument.entryStampRally(
            uid: uid,
            stampRallyId: stampRallyId,
          ).toJson(),
        );
  }
}
