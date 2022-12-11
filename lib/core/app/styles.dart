import 'package:flutter/material.dart';
import 'package:ystop_mystop/core/app/colors.dart';

/// All styles used for widgets go here
class AppStyles {
  AppStyles._();

  /// example-textstyle
  static TextStyle exampleTextstyle = const TextStyle(
    color: AppColors.exampleColor,
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
  );

  /// example-textstyle-2
  static TextStyle exampleTextstyle2 = TextStyle(
    color: AppColors.exampleColorSwatch.shade400,
    fontWeight: FontWeight.w300,
    fontSize: 20.0,
  );

  //login-styles
  static TextStyle loginHeadingStyle = const TextStyle(
    color: AppColors.loginBlackColor,
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
  );
  static TextStyle loginSubHeadingStyle = const TextStyle(
    color: AppColors.loginBlackColor,
    fontWeight: FontWeight.w500,
    fontSize: 13.0,
  );
  static TextStyle loginTextFieldHintStyle = const TextStyle(
    color: AppColors.loginTextFieldHintColor,
    fontWeight: FontWeight.w400,
    fontSize: 13.0,
  );
  static TextStyle loginTextFieldStyle = const TextStyle(
    color: AppColors.loginBlackColor,
    fontWeight: FontWeight.w500,
    fontSize: 13.0,
  );
  static TextStyle loginRememberStyle = const TextStyle(
    color: AppColors.loginRememberColor,
    fontWeight: FontWeight.w500,
    fontSize: 13.0,
  );
  static TextStyle loginButtonTextStyle = const TextStyle(
    color: AppColors.loginButtonTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
  );
  static TextStyle loginForgotPasswordStyle = const TextStyle(
    color: AppColors.loginBlackColor,
    fontWeight: FontWeight.w400,
    fontSize: 13.0,
    fontStyle: FontStyle.italic,
  );
}
