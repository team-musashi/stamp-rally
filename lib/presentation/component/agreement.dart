import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 利用規約とプライバシーポリシーをまとめたウィジェット
class Agreement extends StatelessWidget {
  const Agreement({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'プライバシーポリシー',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await _onLaunchUrl(
                  url:
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
                await _onLaunchUrl(
                  url:
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

  /// リンク文字列タップ時処理
  /// 引数にて指定されたUrlを開く
  Future<void> _onLaunchUrl({required String url}) async {
    final uri = Uri.parse(url);

    // 指定したUrlが無効の場合は処理終了
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
