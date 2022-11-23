import 'package:flutter_riverpod/flutter_riverpod.dart';

/// スタンプラリーサービスプロバイダー
final stampRallyServiceProvider = Provider(
  StampRallyService.new,
);

/// スタンプラリーサービス
///
/// スタンプラリーに関する操作を提供する
/// Widget から呼ばれ、各 Repository や State を操作するロジックを実装する
class StampRallyService {
  const StampRallyService(this.ref);
  final Ref ref;
}
