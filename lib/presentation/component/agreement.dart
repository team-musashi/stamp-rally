import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/url_launcher/url_launcher_service.dart';

/// 利用規約とプライバシーポリシーをまとめたウィジェット
class Agreement extends ConsumerWidget {
  const Agreement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'プライバシーポリシー',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await ref.read(urlLauncherServiceProvider).launch(
                      'https://team-musashi.github.io/stamp-rally-doc/privacy-policy.html',
                    );
              },
          ),
          const TextSpan(
            text: 'と',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'サービス利用規約',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await ref.read(urlLauncherServiceProvider).launch(
                      'https://team-musashi.github.io/stamp-rally-doc/terms-of-service.html',
                    );
              },
          ),
          const TextSpan(
            text: 'に同意して始める',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
