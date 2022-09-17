import 'package:flutter/material.dart';
import 'package:test_app/core/core.dart';

/// As this is not a complete project, so this file
/// only has data that is currently being used.
/// @{template}
/// Contains all the typography, text style and theme data.
/// @{endTemplate}
abstract class AppTypography {
  static final lato = 'Lato';

  static final TextTheme textTheme = TextTheme(
    headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    subtitle1: _subtitle1,
    subtitle2: _subtitle2,
    bodyText1: _bodyText1,
  );

  static final _subtitle1 = TextStyle(
    fontSize: 16,
    color: AppColor.blue,
  );
  static final _subtitle2 = TextStyle(
    fontSize: 14,
    color: AppColor.green,
  );

  static final _headline1 = TextStyle(
    fontSize: 100,
    fontWeight: FontWeight.w400,
    color: AppColor.grey,
  );

  static final _headline2 = TextStyle(
    fontSize: 65,
    fontWeight: FontWeight.bold,
    color: AppColor.black2,
  );

  static final _headline3 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w500,
    color: AppColor.black2,
  );

  static final _bodyText1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColor.grey,
  );
}
