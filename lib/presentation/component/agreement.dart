import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/url_launcher/url_launcher_service.dart';
import '../../domain/entity/app_info.dart';
import 'anchor_text.dart';

/// 利用規約とプライバシーポリシーをまとめたウィジェット
class Agreement extends ConsumerWidget {
  const Agreement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: 'プライバシーポリシー',
            style: AnchorText.anchorStyleText(context),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await ref.read(urlLauncherServiceProvider).launch(
                      ref.read(appInfoProvider).privacyPolicyUrl.toString(),
                    );
              },
          ),
          const TextSpan(text: ' と '),
          TextSpan(
            text: 'サービス利用規約',
            style: AnchorText.anchorStyleText(context),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await ref.read(urlLauncherServiceProvider).launch(
                      ref.read(appInfoProvider).termsOfServiceUrl.toString(),
                    );
              },
          ),
          const TextSpan(text: ' に同意して始める'),
        ],
      ),
    );
  }
}
