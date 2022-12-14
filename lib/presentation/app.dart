import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/url_launcher/exception/url_launcher_exception.dart';
import '../application/url_launcher/state/url_launch_data.dart';
import '../application/url_launcher/state/url_launch_result.dart';
import '../application/user/state/create_user_result.dart';
import '../application/user/state/delete_user_result.dart';
import '../util/extension.dart';
import '../util/logger.dart';
import 'component/dialog.dart';
import 'component/loading.dart';
import 'component/scaffold_messenger.dart';
import 'component/widget_ref.dart';
import 'router.dart';
import 'theme.dart';

/// スタンプラリーアプリ
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // URL起動状態を監視してエラーが起きたらSnackBarを表示する
    // どの画面でURL起動してもここで一括でエラーハンドリングできるようにしている
    ref.listen<AsyncValue<UrlLaunchData?>>(
      urlLaunchResultProvider,
      (previous, next) {
        logger.i('Updated UrlLaunchData: $next');
        next.whenError((error, _) {
          if (error is! UrlLauncherException) {
            return;
          }

          // エラーの場合はSnackBar表示をする
          final state = ref.read(scaffoldMessengerKeyProvider).currentState!;
          state.showSnackBar(
            SnackBar(
              content: Text(
                '${error.data.urlString} を開くことができませんでした',
              ),
            ),
          );
        });
      },
    );

    // ユーザーの作成結果を監視する
    ref.listenResult<void>(
      createUserResultProvider,
      completeMessage: 'ようこそ BURALLY へ！',
    );

    // ユーザーの削除結果を監視する
    ref.listenResult<void>(
      deleteUserResultProvider,
      completeMessage: 'すべてのデータを削除しました。ご利用ありがとうございました！',
    );

    final router = ref.watch(routerProvider);
    final themeData = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'BURALLY',
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      debugShowCheckedModeBanner: false,
      theme: themeData,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('ja')],
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      builder: (context, child) => Consumer(
        builder: (context, ref, _) {
          final isLoading = ref.watch(overlayLoadingProvider);
          return MediaQuery(
            // 全ての端末における文字サイズ設定を固定
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Navigator(
              key: ref.watch(navigatorKeyProvider),
              onPopPage: (route, dynamic _) => false,
              pages: [
                MaterialPage<Widget>(
                  child: Stack(
                    children: [
                      child!,
                      // ローディング状態を見て必要ならローディングを表示する
                      if (isLoading) const OverlayLoading(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
