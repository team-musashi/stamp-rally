// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $loginRoute,
      $homeRoute,
    ];

GoRoute get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'setting',
          factory: $SettingRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'component-gallery',
              factory: $ComponentGalleryRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'public-stamp-rally/:publicStampRallyId',
          factory: $StampRallyViewRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'spot-index',
          factory: $SpotIndexRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SettingRouteExtension on SettingRoute {
  static SettingRoute _fromState(GoRouterState state) => const SettingRoute();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ComponentGalleryRouteExtension on ComponentGalleryRoute {
  static ComponentGalleryRoute _fromState(GoRouterState state) =>
      const ComponentGalleryRoute();

  String get location => GoRouteData.$location(
        '/setting/component-gallery',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $StampRallyViewRouteExtension on StampRallyViewRoute {
  static StampRallyViewRoute _fromState(GoRouterState state) =>
      StampRallyViewRoute(
        publicStampRallyId: state.params['publicStampRallyId']!,
        $extra: state.extra as StampRally?,
      );

  String get location => GoRouteData.$location(
        '/public-stamp-rally/${Uri.encodeComponent(publicStampRallyId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SpotIndexRouteExtension on SpotIndexRoute {
  static SpotIndexRoute _fromState(GoRouterState state) =>
      const SpotIndexRoute();

  String get location => GoRouteData.$location(
        '/spot-index',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
