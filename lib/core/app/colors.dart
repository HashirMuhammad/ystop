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

  static const Color mainThemeColor = Color.fromRGBO(255, 151, 0, 1);

  //login-colors
  static const Color loginBlackColor = Color.fromRGBO(35, 35, 35, 1);
  static const Color loginTextFieldHintColor = Color.fromRGBO(169, 169, 169, 1);
  static const Color loginButtonTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color loginRememberColor = Color.fromRGBO(119, 118, 118, 1);
}
