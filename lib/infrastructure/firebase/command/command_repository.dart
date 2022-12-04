import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/repository/command/command_repository.dart';
import 'document/command_document.dart';

/// Firebase コマンドリポジトリ
class FirebaseCommandRepository implements CommandRepository {
  FirebaseCommandRepository({
    required this.store,
    required this.uid,
  });

  final FirebaseFirestore store;
  final String? uid;

  static const commandCollectionName = 'command';

  @override
  Future<void> entryStampRally({
    required String publicStampRallyId,
  }) async {
    assert(uid != null);
    await store.collection(commandCollectionName).add(
          CommandDocument.entryStampRally(
            uid: uid,
            stampRallyId: publicStampRallyId,
          ).toJson(),
        );
  }
}
