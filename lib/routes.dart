import 'package:flutter/material.dart';
import 'package:ystop_mystop/views/auth/forgot_password.dart';
import 'package:ystop_mystop/views/auth/verifying_forgot_password_otp.dart';
import 'package:ystop_mystop/views/home.dart';
import 'package:ystop_mystop/views/auth/login.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String forgotPassword = '/forgotPassword';
  static const String verifiyingForgotPasswordOTP =
      '/verifiyingForgotPasswordOTP';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const LoginView(),
    home: (BuildContext context) => const HomeView(),
    forgotPassword: (BuildContext context) => const ForgotPasswordView(),
    verifiyingForgotPasswordOTP: (BuildContext context) =>
        const VerifyingForgotPasswordOTPView(),
  };
}
