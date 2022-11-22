import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/repository/user/user_repository.dart';
import '../presentation/page/auth/login_page.dart';
import '../presentation/page/error/error_page.dart';
import '../presentation/page/home/home_page.dart';
import '../presentation/page/setting/setting_page.dart';
import '../util/logger.dart';

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
    errorPageBuilder: (context, state) =>
        ErrorRoute(state.error).buildPage(context),

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

  static const name = 'login';

  @override
  Page<void> buildPage(BuildContext context) {
    return TransitionPage.none(
      name: name,
      child: const LoginPage(),
    );
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SettingRoute>(
      path: 'setting',
    )
  ],
)

/// ホーム画面
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const name = 'home';

  @override
  Page<void> buildPage(BuildContext context) {
    return TransitionPage.slide(
      name: name,
      child: const HomePage(),
    );
  }
}

/// 設定画面
class SettingRoute extends GoRouteData {
  const SettingRoute();

  static const name = 'setting';

  @override
  Page<void> buildPage(BuildContext context) {
    return TransitionPage.slide(
      name: name,
      child: const SettingPage(),
    );
  }
}

/// エラー画面
class ErrorRoute extends GoRouteData {
  const ErrorRoute(
    this.error,
  );

  final Exception? error;

  static const name = 'error';

  @override
  Page<void> buildPage(BuildContext context) => TransitionPage.fade(
        name: name,
        child: ErrorPage(error: error),
      );
}

/// デフォルトのTransitionPage
class TransitionPage extends CustomTransitionPage<void> {
  const TransitionPage({
    required String name,
    required super.child,
    required super.transitionsBuilder,
    super.transitionDuration,
    super.maintainState,
    super.fullscreenDialog,
    super.opaque,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.key,
    super.arguments,
    super.restorationId,
  }) : super(
          name: name,
        );

  /// フェード
  factory TransitionPage.fade({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _fadeTransitionsBuilder,
      );

  /// スライド
  factory TransitionPage.slide({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _slideTransitionsBuilder,
      );

  /// トランジションなし
  factory TransitionPage.none({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _noneTransitionsBuilder,
      );

  static Widget _slideTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
        ),
        child: child,
      );

  static Widget _fadeTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(opacity: animation, child: child);

  static Widget _noneTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}