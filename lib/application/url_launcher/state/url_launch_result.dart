import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'url_launch_data.dart';

/// URL起動結果プロバイダー
final urlLaunchResultProvider = StateProvider<AsyncValue<UrlLaunchData?>>(
  (ref) => const AsyncValue.data(null),
);
