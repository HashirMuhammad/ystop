import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/svg.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/views/home.dart';
import 'package:ystop_mystop/views/widgets/example_loading_spinner.dart';

import '../core/providers/login_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(size.width * 0.09,
                  size.height * 0.12, size.width * 0.09, size.height * 0.02),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    AppImages.loginImage,
                    height: size.height * 0.15,
                    width: size.width * 0.4,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    AppTexts.loginHeading,
                    style: AppStyles.loginHeadingStyle,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    AppTexts.loginSubHeading,
                    style: AppStyles.loginSubHeadingStyle,
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  _buildTextFieldEmail(context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _buildTextFieldPassword(context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: <Widget>[
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          bool rememberMe =
                              ref.watch(loginChangeNotifierProvider).rememberMe;
                          return SizedBox(
                            height: size.height * 0.03,
                            width: size.width * 0.03,
                            child: Checkbox(
                              value: rememberMe,
                              onChanged: (bool? value) {
                                rememberMe = value!;
                                ref
                                    .read(loginChangeNotifierProvider)
                                    .toggleRememberMe();
                              },
                              activeColor: AppColors.mainThemeColor,
                              shape: const CircleBorder(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        AppTexts.loginRemember,
                        style: AppStyles.loginRememberStyle,
                      ),
                      const Spacer(),
                      Text(
                        AppTexts.loginForgotPassword,
                        style: AppStyles.loginForgotPasswordStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  _buildTextFieldEmail(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return TextFormField(
          controller: ref.watch(loginChangeNotifierProvider).emailController,
          decoration: InputDecoration(
            label: const Text(AppTexts.loginTextFieldHintEmail),
            labelStyle: AppStyles.loginTextFieldHintStyle,
            floatingLabelStyle: AppStyles.loginTextFieldHintStyle,
            border: InputBorder.none,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                AppSvg.loginEmailSvg,
                height: 24,
                width: 24,
              ),
            ),
            isDense: true,
          ),
          cursorColor: AppColors.mainThemeColor,
        );
      },
    );
  }

  _buildTextFieldPassword(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return TextFormField(
        obscureText: ref.watch(loginChangeNotifierProvider).isObscure,
        controller: ref.watch(loginChangeNotifierProvider).passwordController,
        decoration: InputDecoration(
          label: const Text(AppTexts.loginTextFieldHintPassword),
          labelStyle: AppStyles.loginTextFieldHintStyle,
          floatingLabelStyle: AppStyles.loginTextFieldHintStyle,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                ref.read(loginChangeNotifierProvider).toggleIsObscure();
              },
              child: SvgPicture.asset(
                AppSvg.loginPasswordSvg,
                height: 24,
                width: 24,
              ),
            ),
          ),
          border: InputBorder.none,
          isDense: true,
        ),
        cursorColor: AppColors.mainThemeColor,
      );
    });
  }

  _buildLoginButton(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.065),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.mainThemeColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return WillPopScope(
                    onWillPop: () async => false,
                    child: const ExampleLoadingSpinner(),
                  );
                },
                barrierDismissible: false,
              );
              await Future<void>.delayed(const Duration(seconds: 2));

              // Navigate to the home screen
              Navigator.of(context).pushAndRemoveUntil<void>(
                CupertinoPageRoute<void>(
                    builder: (BuildContext context) => const HomeView()),
                ModalRoute.withName('/home'),
              );
            },
            child: Text(
              AppTexts.loginButtonText,
              style: AppStyles.loginButtonTextStyle,
            ),
          ),
        ),
      );
    });
  }
}
