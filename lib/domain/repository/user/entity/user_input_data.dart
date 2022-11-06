import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entity/app_platform.dart';

part 'user_input_data.freezed.dart';

/// ユーザー入力データ
///
/// ユーザー情報を更新するときに利用する
@freezed
class UserInputData with _$UserInputData {
  const factory UserInputData({
    AppPlatform? platform,
  }) = _UserInputData;
}
