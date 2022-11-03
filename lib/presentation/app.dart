import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/user/state/create_user_result.dart';
import '../application/user/state/delete_user_result.dart';
import '../config/router.dart';
import '../config/theme.dart';
import 'component/async_value_handler.dart';
import 'component/dialog.dart';
import 'component/loading.dart';
import 'component/scaffold_messanger.dart';

/// アプリ
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ユーザーの作成結果を監視する
    ref.listenResult(
      createUserResultProvider,
      completeMessage: 'ようこそ！',
    );

    // ユーザーの削除結果を監視する
    ref.listenResult(
      deleteUserResultProvider,
      completeMessage: 'ユーザーを削除しました。',
    );

    final router = ref.watch(routerProvider);
    final themeData = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'Stamp rally',
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      builder: (context, child) => Consumer(
        builder: (context, ref, _) {
          final isLoading = ref.watch(overlayLoadingProvider);
          return Navigator(
            key: ref.watch(navigatorKeyProvider),
            onPopPage: (route, dynamic _) => false,
            pages: [
              MaterialPage<Widget>(
                child: Stack(
                  children: [
                    child!,
                    if (isLoading) const OverlayLoading(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
