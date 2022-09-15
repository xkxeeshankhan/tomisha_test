// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:test_app/core/core.dart';
import 'package:test_app/home/home.dart';
import 'package:test_app/splash/splash.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigationKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _splashTimoutDelay();
  }

  _splashTimoutDelay() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(_navigationKey.currentState?.context ?? context)
          .pushReplacement(HomePage.route());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        textTheme: AppTypography.textTheme,
        fontFamily: AppTypography.lato,
      ),
      navigatorKey: _navigationKey,
      home: const SplashPage(),
    );
  }
}
