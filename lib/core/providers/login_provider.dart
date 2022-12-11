import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<LoginProvider> loginChangeNotifierProvider =
    ChangeNotifierProvider((ChangeNotifierProviderRef<LoginProvider> ref) {
  return LoginProvider(ref);
});

class LoginProvider extends ChangeNotifier {
  LoginProvider(this._ref);
  final Ref _ref;
  bool _rememberMe = false;
  bool _isObscure = true;

  bool get rememberMe => _rememberMe;
  bool get isObscure => _isObscure;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggleIsObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }
}
