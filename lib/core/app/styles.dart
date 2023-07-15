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
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Graphik',
    fontSize: 25.0,
  );
  static TextStyle loginSubHeadingStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Graphik',
    fontSize: 22.0,
  );
  static TextStyle loginTextFieldHintStyle = const TextStyle(
    color: AppColors.primaryGreyColor,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    fontFamily: 'Graphik',
  );

  static TextStyle loginRememberStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    fontFamily: 'Graphik',
  );
  static TextStyle loginButtonTextStyle = const TextStyle(
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    fontFamily: 'Graphik',
  );
  static TextStyle loginForgotPasswordStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    fontFamily: 'Graphik',
  );
  static TextStyle loginSupportHelpStyle = const TextStyle(
    color: AppColors.mainThemeColor,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    fontFamily: 'Graphik',
  );
  static TextStyle loginTextFieldStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w500,
    fontSize: 13.0,
    fontFamily: 'Graphik',
  );

  //forgotPassword-textstyles
  static TextStyle forgotPasswordHeadingStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Graphik',
    fontSize: 16.0,
  );
  static TextStyle forgotPasswordTextStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Graphik',
    fontSize: 15.0,
  );
  static TextStyle forgotPasswordHintStyle = const TextStyle(
    color: AppColors.primaryGreyColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Graphik',
    fontSize: 16.0,
  );
  static TextStyle forgotPasswordButtonStyle = const TextStyle(
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.w500,
    fontFamily: 'Graphik',
    fontSize: 16.0,
  );
  static TextStyle forgotPasswordCodeSent = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Graphik',
    fontSize: 14.0,
  );
  static TextStyle forgotPasswordTime = const TextStyle(
    color: AppColors.mainThemeColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Graphik',
    fontSize: 14.0,
  );
  static TextStyle forgotPasswordOTP = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Graphik',
    fontSize: 18.0,
  );
  static TextStyle forgotPasswordOTPVerified = const TextStyle(
    color: AppColors.primaryGreenColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Graphik',
    fontSize: 14.0,
  );
  static TextStyle forgotPasswordCreateNewPassword = const TextStyle(
    color: AppColors.primaryGreyColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Graphik',
    fontSize: 14.0,
  );

  //home-textstyles
  static TextStyle homeGreet = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Graphik',
    fontSize: 16.0,
  );
  static TextStyle homeWelcome = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Graphik',
    fontSize: 12.0,
  );
  static TextStyle homeCategory = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Graphik',
    fontSize: 16.0,
  );

  //jobList
  static TextStyle jobListHeadingStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Graphik',
    fontSize: 16.0,
  );
  static TextStyle jobListTextStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Graphik',
    fontSize: 14.0,
  );
  static TextStyle jobListTextStyleGrey = const TextStyle(
    color: AppColors.primaryGreyColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Graphik',
    fontSize: 14.0,
  );
  static TextStyle jobListTextStyleGreen = const TextStyle(
    color: AppColors.primaryGreenColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Graphik',
    fontSize: 12.0,
  );


  //Receive Media
  static TextStyle receiveMediaHeadingStyle = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Graphik',
    fontSize: 16.0,
  );


  /// custom text style
  //Receive Media
  static TextStyle textStyleCustom = const TextStyle(
    color: AppColors.primaryBlackColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Graphik',
    fontSize: 16.0,
  );
  
}
