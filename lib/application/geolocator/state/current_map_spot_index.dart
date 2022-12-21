import 'package:flutter_riverpod/flutter_riverpod.dart';

/// マップ表示の現在選択中のスポットのインデックス
final currentMapSpotIndexProvider = StateProvider(
  (_) => 0,
  name: 'currentMapSpotIndexProvider',
);
