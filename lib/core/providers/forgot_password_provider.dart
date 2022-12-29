import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<ForgotPasswordProvider> forgotPasswordProvider =
    ChangeNotifierProvider(
        (ChangeNotifierProviderRef<ForgotPasswordProvider> ref) {
  return ForgotPasswordProvider(ref);
});

class ForgotPasswordProvider extends ChangeNotifier {
  ForgotPasswordProvider(this._ref);
  final Ref _ref;
  bool _rememberMe = false;
  bool _isObscure = true;

  bool get rememberMe => _rememberMe;
  bool get isObscure => _isObscure;

  TextEditingController forgotPasswordEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  FocusNode pinOTPCodeFocus = FocusNode();

  void toggleIsObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }
}
