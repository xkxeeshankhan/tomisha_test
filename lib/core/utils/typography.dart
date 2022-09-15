import 'package:flutter/material.dart';
import 'package:test_app/core/core.dart';

abstract class AppTypography {
  static final lato = 'Lato';

  static final TextTheme textTheme = TextTheme(
    subtitle1: _subtitle1,
  );

  static final _subtitle1 = TextStyle(
    fontSize: 16,
    color: AppColor.blue,
  );
}
