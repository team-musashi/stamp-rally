import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/user/state/login_anonymously_result.dart';
import '../../../application/user/user_service.dart';
import '../../component/async_value_handler.dart';

/// ようこそ画面
class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listenResult(
      loginAnonymouslyResultProvider,
      completeMessage: 'ようこそ！',
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                await ref.read(userServiceProvider).loginAnonymously();
              },
              child: const Text('はじめる'),
            ),
          ],
        ),
      ),
    );
  }
}
