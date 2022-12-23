import 'package:flutter/material.dart';

import 'complete_view.dart';
import 'entry_view.dart';
import 'public_view.dart';

/// ホーム画面のタブ
enum HomeTab {
  /// 公開中
  public(
    title: '公開中',
    view: PublicView(),
  ),

  /// 参加中
  entry(
    title: '参加中',
    view: EntryView(),
  ),

  /// 完了済
  complete(
    title: '完了済',
    view: CompleteView(),
  ),
  ;

  const HomeTab({
    required this.title,
    required this.view,
  });

  final String title;
  final Widget view;
}
