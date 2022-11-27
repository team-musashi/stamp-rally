import 'package:flutter/material.dart';
import '../../../util/assets/assets.gen.dart';

import '../../component/agreement.dart';
import '../../component/create_user.dart';

/// ログイン画面
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 167, 118, 1),
              Color.fromRGBO(255, 115, 241, 1)
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
                CreateUserButton(),
                SizedBox(
                  height: 12,
                ),
                Agreement()
              ],
            )
          ],
        ),
      ),
    );
  }
}
