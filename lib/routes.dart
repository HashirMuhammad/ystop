import 'package:flutter/material.dart';
import 'package:ystop_mystop/views/home.dart';
import 'package:ystop_mystop/views/login.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const LoginView(),
    home: (BuildContext context) => const HomeView(),
  };
}
