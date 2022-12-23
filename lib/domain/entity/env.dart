import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'env.freezed.dart';

/// 環境変数プロバイダー
final envProvider = Provider<Env>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// 環境変数
@freezed
class Env with _$Env {
  const factory Env({
    /// Google Map APIキー
    required String googleMapAPIKey,
  }) = _Env;

  const Env._();
}
