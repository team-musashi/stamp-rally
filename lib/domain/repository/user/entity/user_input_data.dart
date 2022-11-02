import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entity/app_platform.dart';

part 'user_input_data.freezed.dart';

/// ユーザー入力データ
@freezed
class UserInputData with _$UserInputData {
  const factory UserInputData({
    AppPlatform? createdPlatform,
  }) = _UserInputData;
}
