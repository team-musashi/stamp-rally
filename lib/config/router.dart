import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/repository/auth/auth_repository.dart';
import '../presentation/page/error/error_page.dart';
import '../presentation/page/home/home_page.dart';
import '../presentation/page/welcome/welcome_page.dart';
import '../util/logger.dart';

part 'router.g.dart';

/// 画面遷移の定義Provider
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    routes: $appRoutes,

    // エラー画面
    errorPageBuilder: (context, state) =>
        ErrorRoute(state.error).buildPage(context),

    // リダイレクト
    redirect: (context, state) {
      final authUser = ref.watch(authRepositoryProvider).getAuthUser();
      if (authUser != null) {
        // ログイン済み
        return null;
      }

      if (state.location == const WelcomeRoute().location) {
        return null;
      }

      // 未ログインなら Welcome 画面にリダイレクトする
      logger.i(
        '[GO_ROUTER][REDIRECT] Redirect to root: '
        'location = ${state.location}',
      );
      return const WelcomeRoute().location;
    },
  ),
);

@TypedGoRoute<WelcomeRoute>(
  path: '/welcome',
)

/// Welcome 画面
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  static const name = 'welcome';

  @override
  Page<void> buildPage(BuildContext context) {
    return TransitionPage.none(
      name: name,
      child: const WelcomePage(),
    );
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
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

  factory TransitionPage.fade({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _fadeTransitionsBuilder,
      );

  factory TransitionPage.slide({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _slideTransitionsBuilder,
      );

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
