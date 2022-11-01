import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_provider.dart';

part 'auth_user.freezed.dart';

/// 認証ユーザーエンティティ
@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    /// ユーザーID
    required String uid,

    /// 認証プロバイダー
    required AuthProvider provider,
  }) = _AuthUser;
}
