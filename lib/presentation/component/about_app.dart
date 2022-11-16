import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutAppSection extends ConsumerWidget {
  const AboutAppSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Todo PackageInfoPlusのProviderから取得する
    const applicationName = 'Stamp-Rally';
    const applicationVersion = '1.0.0';

    return GestureDetector(
      onTap: () => showAboutDialog(
        context: context,
        applicationName: applicationName,
        applicationVersion: applicationVersion,
        applicationIcon:
            const Icon(Icons.apple_sharp), // Todo アプリIconが決まったら差し替え
        applicationLegalese: '(C)2022 stamp-rally', // Todo 権利情報が決まったら差し替え
      ),
      // Todo PackageInfoPlusから取得する
      child: const AboutApp(
        applicationVersion: applicationVersion,
      ),
    );
  }
}

class AboutApp extends StatelessWidget {
  const AboutApp({
    super.key,
    required this.applicationVersion,
  });

  final String applicationVersion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('このアプリについて', style: TextStyle(fontSize: 16)),
          Text(
            'v$applicationVersion',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
