import 'package:flutter/material.dart';
import 'package:test_app/core/core.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Text(
          'Splash',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
