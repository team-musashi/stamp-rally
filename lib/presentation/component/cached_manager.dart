import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// CachedNetworkImageで使用するキャッシュ設定
final defaultCacheManagerProvider = Provider(
  (_) => CacheManager(
    Config(
      'CachedImagekey',
      stalePeriod: const Duration(days: 1), // キャッシュ保持期間(デフォルト30日)
      maxNrOfCacheObjects: 20, // キャッシュできる最大数(デフォルト200)
    ),
  ),
);
