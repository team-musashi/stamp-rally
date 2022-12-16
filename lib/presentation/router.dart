import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/stamp_rally/state/current_entry_stamp_rally.dart';
import '../application/stamp_rally/state/current_public_spot.dart';
import '../application/stamp_rally/state/current_public_stamp_rally.dart';
import '../application/stamp_rally/state/spot_param.dart';
import '../application/stamp_rally/state/stamp_rally_param.dart';
import '../domain/repository/stamp_rally/entity/spot.dart';
import '../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../domain/repository/user/user_repository.dart';
import '../presentation/page/auth/login_page.dart';
import '../presentation/page/error/error_page.dart';
import '../presentation/page/home/home_page.dart';
import '../presentation/page/setting/setting_page.dart';
import '../util/logger.dart';
import 'page/debug/component_gallery/component_gallery_page.dart';
import 'page/stamp_rally/entry_spot_index_page.dart';
import 'page/stamp_rally/public_spot_view_page.dart';
import 'page/stamp_rally/public_stamp_rally_view_page.dart';

part 'router.g.dart';

const _logPrefix = '[GO_ROUTER]';

/// ルータープロバイダー
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    // 初期表示するパス
    initialLocation: const HomeRoute().location,

    // ルート定義
    routes: $appRoutes,

    // エラー画面
    errorBuilder: (context, state) => ErrorRoute(state.error).build(context),

    // リダイレクト
    redirect: (context, state) {
      const prefix = '$_logPrefix redirect():';
      logger.i('$prefix START location = ${state.location}');

      final loggedIn = ref.read(loggedInProvider).value;
      logger.i('$prefix loggedIn = $loggedIn');
      if (loggedIn == null) {
        // 表示直後はログイン状態が未確定（loggedIn が null になる）
        // 直後にログイン状態が確定して再度 redirect() が呼ばれるので保留の意味でいったん null を返す
        logger.i('$prefix END undetermined loggedIn');
        return null;
      }

      if (loggedIn) {
        // ログイン済みで、ログイン画面ならホーム画面にリダイレクトする
        if (state.location == const LoginRoute().location) {
          final location = const HomeRoute().location;
          logger.i('$prefix END redirect to $location');
          return location;
        }
        logger.i('$prefix END do nothing because loggedIn is true');
        return null;
      }

      // 未ログインでも表示できる画面ならリダイレクトしない
      if (state.location == const LoginRoute().location) {
        logger.i('$prefix END do nothing');
        return null;
      }

      // 未ログインならログイン画面にリダイレクトする
      final location = const LoginRoute().location;
      logger.i('$prefix END redirect to $location');
      return location;
    },

    // ログイン状態の変化を検知してリダイレクトを再実行する
    refreshListenable:
        GoRouterRefreshNotifier(ref.watch(loggedInProvider.stream)),
  ),
);

/// ログイン状態の変化を通知する
class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
)

/// ログイン画面
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SettingRoute>(
      path: 'setting',
      routes: [
        TypedGoRoute<ComponentGalleryRoute>(
          path: 'component-gallery',
        )
      ],
    ),
    TypedGoRoute<PublicStampRallyViewRoute>(
      path: 'public-stamp-rally/:publicStampRallyId',
      routes: [
        TypedGoRoute<PublicSpotViewRoute>(
          path: ':publicSpotId',
        ),
      ],
    ),
    TypedGoRoute<EntrySpotIndexRoute>(
      path: 'entry-stamp-rally/spots',
    ),
  ],
)

/// ホーム画面
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

/// 公開スタンプラリー詳細画面
class PublicStampRallyViewRoute extends GoRouteData {
  PublicStampRallyViewRoute({
    required this.publicStampRallyId,
    // 【暫定対応】extraがあると次のネストした画面を開いたときにエラーになる
    // this.$extra,
  });

  factory PublicStampRallyViewRoute.fromStampRally(
    StampRally stampRally,
  ) =>
      PublicStampRallyViewRoute(
        publicStampRallyId: stampRally.id,
        // $extra: stampRally,
      );

  /// 公開中のスタンプラリーID
  final String publicStampRallyId;

  /// キャッシュ
  // StampRally? $extra;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        // 現在の公開中のスタンプラリーパラメータを上書きする
        currentPublicStampRallyParamProvider.overrideWithValue(
          StampRallyParam(
            stampRallyId: publicStampRallyId,
            // cache: $extra,
          ),
        ),
      ],
      child: const PublicStampRallyViewPage(),
    );
  }
}

/// 公開中スポット詳細画面
class PublicSpotViewRoute extends GoRouteData {
  PublicSpotViewRoute({
    required this.publicStampRallyId,
    required this.publicSpotId,
    this.$extra,
  });

  factory PublicSpotViewRoute.fromSpot(
    StampRally stampRally,
    Spot spot,
  ) =>
      PublicSpotViewRoute(
        publicStampRallyId: stampRally.id,
        publicSpotId: spot.id,
        $extra: spot,
      );

  /// スタンプラリー詳細画面に表示中のスタンプラリーID
  final String publicStampRallyId;

  /// スポット詳細画面に表示中のスポットID
  final String publicSpotId;

  /// スポット詳細画面に表示中のスポット情報
  Spot? $extra;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        // 現在のスタンプラリーパラメータをスタンプラリー詳細画面のスタンプラリー情報で上書き
        currentPublicStampRallyParamProvider.overrideWithValue(
          StampRallyParam(
            stampRallyId: publicStampRallyId,
          ),
        ),
        // 現在のスポットパラメータをスポット詳細画面のスポット情報で上書き
        currentPublicSpotParamProvider.overrideWithValue(
          SpotParam(
            spotId: publicSpotId,
            cache: $extra,
          ),
        ),
      ],
      child: const PublicSpotViewPage(),
    );
  }
}

/// 参加スポット一覧画面
class EntrySpotIndexRoute extends GoRouteData {
  EntrySpotIndexRoute({
    this.$extra,
  });

  factory EntrySpotIndexRoute.fromStampRally(
    StampRally stampRally,
  ) =>
      EntrySpotIndexRoute(
        $extra: stampRally,
      );

  /// スタンプラリー詳細画面に表示中のスタンプラリー情報
  StampRally? $extra;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        // 現在の参加中のスタンプラリーを上書きする
        currentEntryStampRallyProvider.overrideWith((ref) => $extra),
      ],
      child: const EntrySpotIndexPage(),
    );
  }
}

/// 設定画面
class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context) {
    return const SettingPage();
  }
}

/// エラー画面
class ErrorRoute extends GoRouteData {
  const ErrorRoute(
    this.error,
  );

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return ErrorPage(error: error);
  }
}

/// コンポーネントギャラリー画面
class ComponentGalleryRoute extends GoRouteData {
  const ComponentGalleryRoute();

  static const title = 'Component Gallery';

  @override
  Widget build(BuildContext context) {
    return const ComponentGalleryPage();
  }
}
