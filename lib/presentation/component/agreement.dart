import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/url_launcher/url_launcher_service.dart';
import '../../domain/entity/app_info.dart';

/// 利用規約とプライバシーポリシーをまとめたウィジェット
class Agreement extends ConsumerWidget {
  const Agreement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: '利用規約',
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await ref.read(urlLauncherServiceProvider).launch(
                      ref.read(appInfoProvider).termsOfServiceUrl.toString(),
                    );
              },
          ),
          const TextSpan(
            text: ' と ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'プライバシーポリシー',
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await ref.read(urlLauncherServiceProvider).launch(
                      ref.read(appInfoProvider).privacyPolicyUrl.toString(),
                    );
              },
          ),
          const TextSpan(
            text: ' に\n同意の上ご利用ください',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
