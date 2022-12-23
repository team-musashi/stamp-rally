import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'url_launch_data.freezed.dart';

/// URL起動データ
@freezed
class UrlLaunchData with _$UrlLaunchData {
  const factory UrlLaunchData({
    required String urlString,
    required LaunchMode mode,
  }) = _UrlLaunchData;

  const UrlLaunchData._();
}
