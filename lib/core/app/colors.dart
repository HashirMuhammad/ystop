import 'package:flutter/material.dart';

/// All constant colours used as a resource go here
class AppColors {
  AppColors._();

  /// example-color-swatch
  static const MaterialColor exampleColorSwatch =
      MaterialColor(0xFF53565A, <int, Color>{
    50: Color(0xFFEAEBEB),
    100: Color(0xFFCBCCCE),
    200: Color(0xFFA9ABAD),
    300: Color(0xFF87898C),
    400: Color(0xFF6D6F73),
    500: Color(0xFF53565A),
    600: Color(0xFF4C4F52),
    700: Color(0xFF424548),
    800: Color(0xFF393C3F),
    900: Color(0xFF292B2E),
  });

  /// example-color
  static const Color exampleColor = Color(0xFF15A7E8);

  static const Color mainThemeColor = Color(0xFFF79320);
  static const Color primaryWhite = Color.fromRGBO(255, 255, 255, 1);
  static const Color primaryBlackColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color primaryGreyColor = Color.fromRGBO(111, 111, 112, 1);
    static const Color greyColor = Color.fromRGBO(185, 195, 199,1);

  //#CCD1D1
  static const Color primaryGreenColor = Color.fromRGBO(27, 138, 17, 1);
  static const Color blueColor = Colors.blue;
  static const Color redColor = Colors.red;
  static const Color tranparentColor = Colors.transparent;

  static const Color primaryOtpPinColor = Color.fromRGBO(233, 254, 199, 1);
  static const Color primaryJobListContainerColor =
      Color.fromRGBO(246, 246, 246, 1);
  // //login-colors
  // static const Color loginBlackColor = Color.fromRGBO(0, 0, 0, 1);
  // static const Color loginTextFieldHintColor = Color.fromRGBO(111, 111, 112, 1);
  // static const Color loginButtonTextColor = Color.fromRGBO(255, 255, 255, 1);
  // static const Color loginErrorBorderColor = Color.fromRGBO(255, 47, 47, 1);

  // //forgotPassword-colors
  // static const Color forgotPasswordBlackColor = Color.fromRGBO(0, 0, 0, 1);
  // static const Color forgotPasswordTextFieldHintColor =
  //     Color.fromRGBO(111, 111, 112, 1);
}
