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
          factory: $PublicStampRallyViewRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'spots',
              factory: $PublicSpotIndexRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'entry-stamp-rally/spots',
          factory: $EntrySpotIndexRouteExtension._fromState,
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

extension $PublicStampRallyViewRouteExtension on PublicStampRallyViewRoute {
  static PublicStampRallyViewRoute _fromState(GoRouterState state) =>
      PublicStampRallyViewRoute(
        publicStampRallyId: state.params['publicStampRallyId']!,
      );

  String get location => GoRouteData.$location(
        '/public-stamp-rally/${Uri.encodeComponent(publicStampRallyId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $PublicSpotIndexRouteExtension on PublicSpotIndexRoute {
  static PublicSpotIndexRoute _fromState(GoRouterState state) =>
      PublicSpotIndexRoute(
        publicStampRallyId: state.params['publicStampRallyId']!,
        $extra: state.extra as StampRally?,
      );

  String get location => GoRouteData.$location(
        '/public-stamp-rally/${Uri.encodeComponent(publicStampRallyId)}/spots',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EntrySpotIndexRouteExtension on EntrySpotIndexRoute {
  static EntrySpotIndexRoute _fromState(GoRouterState state) =>
      EntrySpotIndexRoute(
        $extra: state.extra as StampRally?,
      );

  String get location => GoRouteData.$location(
        '/entry-stamp-rally/spots',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
