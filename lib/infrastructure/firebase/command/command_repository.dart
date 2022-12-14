import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/command/command_repository.dart';
import '../firebase.dart';
import 'document/command_document.dart';

/// コマンドコレクション参照プロバイダー
final commandCollectionRefProvider = Provider(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('command')
      .withConverter<CommandDocument>(
        fromFirestore: (snapshot, _) =>
            CommandDocument.fromJson(snapshot.data()!),
        toFirestore: (commandDoc, options) {
          final json = commandDoc.toJson();
          if (options?.merge ?? false) {
            // null で上書きされてしまうのでマージの場合は null は除外する
            json.removeWhere((field, dynamic value) => value == null);
          }
          return json;
        },
      ),
);

/// Firebase コマンドリポジトリ
class FirebaseCommandRepository implements CommandRepository {
  FirebaseCommandRepository({
    required this.commandCollectionRef,
    required this.uid,
  });

  final CollectionReference<CommandDocument> commandCollectionRef;
  final String? uid;

  @override
  Future<void> entryStampRally({
    required String publicStampRallyId,
  }) async {
    assert(uid != null);
    await commandCollectionRef.add(
      CommandDocument.entryStampRally(
        uid: uid,
        stampRallyId: publicStampRallyId,
      ),
    );
  }

  @override
  Future<void> completeStampRally({required String entryStampRallyId}) async {
    assert(uid != null);
    await commandCollectionRef.add(
      CommandDocument.completeStampRally(
        uid: uid,
        stampRallyId: entryStampRallyId,
      ),
    );
  }
}
