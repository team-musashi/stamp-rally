import 'package:flutter/material.dart';

import 'entry_details_view.dart';
import 'entry_map_view.dart';

/// 参加中タブのトグルスイッチ
///
/// 参加中スタンプラリー詳細表示モード or 参加中スタンプラリーマップ表示モード
enum EntryToggleSwitch {
  /// 詳細表示
  details(
    title: '参加中スタンプラリー詳細',
    view: EntryDetailsView(),
  ),

  /// マップ表示
  map(
    title: '参加中スタンプラリーマップ',
    view: EntryMapView(),
  ),
  ;

  const EntryToggleSwitch({
    required this.title,
    required this.view,
  });

  final String title;
  final Widget view;
}
