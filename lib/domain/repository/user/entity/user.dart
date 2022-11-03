import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entity/app_platform.dart';
import 'auth_provider.dart';

part 'user.freezed.dart';

/// ユーザー
@freezed
class User with _$User {
  const factory User({
    /// ユーザーID
    required String uid,

    /// 認証プロバイダー
    required AuthProvider authProvider,

    /// 作成時のプラットフォーム
    AppPlatform? platform,

    /// 作成日時
    DateTime? createdAt,

    /// 更新日時
    DateTime? updatedAt,
  }) = _User;
}
