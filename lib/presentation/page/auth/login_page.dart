import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../util/assets/assets.gen.dart';
import '../../component/agreement.dart';
import '../../component/button_box.dart';
import '../../component/create_user.dart';

/// ログイン画面
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Assets.images.iconStamp.image(height: 36),
                Assets.images.logoStampRarry.image(height: 146),
              ],
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 56),
                  child: ButtonBox(
                    child: CreateUserButton(),
                  ),
                ),
                Gap(12),
                Agreement()
              ],
            )
          ],
        ),
      ),
    );
  }
}
