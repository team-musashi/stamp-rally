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
              path: ':publicSpotId',
              factory: $PublicSpotViewRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'entry-stamp-rally/:entryStampRallyId',
          factory: $EntrySpotIndexRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':entrySpotId',
              factory: $EntrySpotViewRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'complete-stamp-rally/:completeStampRallyId',
          factory: $CompleteStampRallyViewRouteExtension._fromState,
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

extension $PublicSpotViewRouteExtension on PublicSpotViewRoute {
  static PublicSpotViewRoute _fromState(GoRouterState state) =>
      PublicSpotViewRoute(
        publicStampRallyId: state.params['publicStampRallyId']!,
        publicSpotId: state.params['publicSpotId']!,
        $extra: state.extra as Spot?,
      );

  String get location => GoRouteData.$location(
        '/public-stamp-rally/${Uri.encodeComponent(publicStampRallyId)}/${Uri.encodeComponent(publicSpotId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EntrySpotIndexRouteExtension on EntrySpotIndexRoute {
  static EntrySpotIndexRoute _fromState(GoRouterState state) =>
      EntrySpotIndexRoute(
        entryStampRallyId: state.params['entryStampRallyId']!,
      );

  String get location => GoRouteData.$location(
        '/entry-stamp-rally/${Uri.encodeComponent(entryStampRallyId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EntrySpotViewRouteExtension on EntrySpotViewRoute {
  static EntrySpotViewRoute _fromState(GoRouterState state) =>
      EntrySpotViewRoute(
        entryStampRallyId: state.params['entryStampRallyId']!,
        entrySpotId: state.params['entrySpotId']!,
        $extra: state.extra as Spot?,
      );

  String get location => GoRouteData.$location(
        '/entry-stamp-rally/${Uri.encodeComponent(entryStampRallyId)}/${Uri.encodeComponent(entrySpotId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $CompleteStampRallyViewRouteExtension on CompleteStampRallyViewRoute {
  static CompleteStampRallyViewRoute _fromState(GoRouterState state) =>
      CompleteStampRallyViewRoute(
        completeStampRallyId: state.params['completeStampRallyId']!,
        $extra: state.extra as StampRally?,
      );

  String get location => GoRouteData.$location(
        '/complete-stamp-rally/${Uri.encodeComponent(completeStampRallyId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
