import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/svg.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/views/forgot_password/views/forgot_password_view.dart';
import '../../core/providers/login_provider.dart';

class LoginView2 extends ConsumerStatefulWidget {
  const LoginView2({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginView2State();
}

class _LoginView2State extends ConsumerState<LoginView2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.06,
                    size.height * 0.03, size.width * 0.09, size.height * 0.02),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      AppImages.logoImage,
                      height: size.height * 0.15,
                      width: size.width * 0.4,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppTexts.loginSubHeading,
                          style: AppStyles.loginSubHeadingStyle,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          AppTexts.loginHeading,
                          style: AppStyles.loginHeadingStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    _buildTextFieldEmail(context),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    _buildTextFieldPassword(context),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04),
                      child: Row(
                        children: <Widget>[
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              bool rememberMe = ref
                                  .watch(loginChangeNotifierProvider)
                                  .rememberMe;
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildLoginButton(context),
              SizedBox(
                height: size.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push<void>(
                    CupertinoPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ForgotPasswordView()),
                  );
                },
                child: Text(
                  AppTexts.loginForgotPassword,
                  style: AppStyles.loginForgotPasswordStyle,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Image.asset(
                AppImages.SecureImage,
                height: size.height * 0.2,
                width: size.width * 0.4,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                AppTexts.loginSupportHelp,
                style: AppStyles.loginSupportHelpStyle,
              )
            ],
          ),
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
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                AppSvg.loginEmailSvg,
                height: 20,
                width: 20,
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
          suffixIcon: InkWell(
            onTap: () {
              ref.read(loginChangeNotifierProvider).toggleIsObscure();
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                AppSvg.loginVisibilitySvg,
                height: 20,
                width: 20,
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              AppSvg.loginPasswordSvg,
              height: 20,
              width: 20,
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
        child: InkWell(
          onTap: () async {
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return WillPopScope(
            //       onWillPop: () async => false,
            //       child: const ExampleLoadingSpinner(),
            //     );
            //   },
            //   barrierDismissible: false,
            // );
            // await Future<void>.delayed(const Duration(seconds: 2));

            // Navigate to the home screen
            // Navigator.of(context).pushAndRemoveUntil<void>(
            //   CupertinoPageRoute<void>(
            //       builder: (BuildContext context) => const HomeView()),
            //   ModalRoute.withName('/home'),
            // );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: AppColors.mainThemeColor,
              borderRadius: BorderRadius.circular(47),
            ),
            child: Center(
              child: Text(
                AppTexts.loginButtonText,
                style: AppStyles.loginButtonTextStyle,
              ),
            ),
          ),
        ),
      );
    });
  }
}
