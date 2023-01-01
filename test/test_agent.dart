import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stamp_rally/application/stamp_rally/state/pin_icon.dart';
import 'package:stamp_rally/domain/repository/stamp_rally/stamp_rally_repository.dart';
import 'package:stamp_rally/presentation/page/home/component/entry_view.dart';

import 'infrastructure/mock/mock_stamp_rally_repository.dart';

/// テストエージェント
class TestAgent {
  TestAgent();
  late ProviderContainer container;

  Future<void> setUp() async {
    container = ProviderContainer(
      overrides: [
        stampRallyRepositoryProvider
            .overrideWithValue(MockStampRallyRepository())
      ],
    );
  }

  /// EntryView用ProviderScope生成ヘルパーメソッド
  Widget createDefaultProviderScopeForEntryView() {
    return ProviderScope(
      overrides: [
        stampRallyRepositoryProvider
            .overrideWithValue(MockStampRallyRepository()),
        pinIconProvider.overrideWithValue(BitmapDescriptor.defaultMarker)
      ],
      child: const MaterialApp(home: Scaffold(body: EntryView())),
    );
  }
}
