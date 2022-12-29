// ignore_for_file: prefer_const_constructors, prefer_single_quotes

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/app/svg.dart';

import '../../core/app/colors.dart';
import '../../core/app/styles.dart';
import '../../core/app/texts.dart';
import '../../core/providers/forgot_password_provider.dart';

class VerifyingForgotPasswordOTPView extends ConsumerStatefulWidget {
  const VerifyingForgotPasswordOTPView({super.key});

  @override
  ConsumerState<VerifyingForgotPasswordOTPView> createState() =>
      _VerifyingForgotPasswordOTPViewState();
}

class _VerifyingForgotPasswordOTPViewState
    extends ConsumerState<VerifyingForgotPasswordOTPView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: AppColors.primaryBlackColor,
          ),
        ),
        elevation: 0,
        title: Text(
          AppTexts.forgotPassword,
          style: AppStyles.forgotPasswordHeadingStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.asset(
              AppImages.verifyingOTPImage,
              height: size.height * 0.25,
              width: size.width * 0.38,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Row(
                children: [
                  Text(
                    "Code has been sent to abc@gmail.com",
                    style: AppStyles.forgotPasswordCodeSent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return Pinput(
                  length: 4,
                  autofocus: true,
                  focusNode: ref.watch(forgotPasswordProvider).pinOTPCodeFocus,
                  defaultPinTheme: PinTheme(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryWhite,
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                      height: size.height * 0.12,
                      width: size.width * 0.17,
                      textStyle: AppStyles.forgotPasswordOTP,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryOtpPinColor,
                        border: Border.all(
                          color: AppColors.primaryGreenColor,
                        ),
                      )),
                  disabledPinTheme: PinTheme(
                      height: size.height * 0.12,
                      width: size.width * 0.17,
                      textStyle: AppStyles.forgotPasswordOTP,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryOtpPinColor,
                        border: Border.all(
                          color: AppColors.primaryGreenColor,
                        ),
                      )),
                  submittedPinTheme: PinTheme(
                      height: size.height * 0.12,
                      width: size.width * 0.17,
                      textStyle: AppStyles.forgotPasswordOTP,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryOtpPinColor,
                        border: Border.all(
                          color: AppColors.primaryGreenColor,
                        ),
                      )),
                );
              },
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SvgPicture.asset(
            //       AppSvg.forgotPasswordOtpDoneSvg,
            //       height: 20,
            //       width: 20,
            //     ),
            //     SizedBox(
            //       width: size.width * 0.007,
            //     ),
            //     Text(
            //       AppTexts.forgotPasswordOTPVerified,
            //       style: AppStyles.forgotPasswordOTPVerified,
            //     )
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         height: 1,
            //         width: size.width * 0.25,
            //         color: Colors.grey,
            //       ),
            //       SizedBox(
            //         width: size.width * 0.03,
            //       ),
            //       Text(
            //         AppTexts.forgotPasswordCreateNewPassword,
            //         style: AppStyles.forgotPasswordCreateNewPassword,
            //       ),
            //       SizedBox(
            //         width: size.width * 0.03,
            //       ),
            //       Container(
            //         height: 1,
            //         width: size.width * 0.25,
            //         color: Colors.grey,
            //       ),
            //     ],
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppTexts.forgotPasswordResendText,
                  style: AppStyles.forgotPasswordCodeSent,
                ),
                SizedBox(
                  width: size.width * 0.007,
                ),
                Text(
                  "1 minute",
                  style: AppStyles.forgotPasswordTime,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            // _buildTextFieldPassword(context),
            // _buildTextFieldConfirmPassword(context),
            // SizedBox(
            //   height: size.height * 0.015,
            // ),
            _buildContinueButton(context),
          ],
        ),
      ),
    );
  }

  _buildTextFieldPassword(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          obscureText: ref.watch(forgotPasswordProvider).isObscure,
          controller: ref.watch(forgotPasswordProvider).newPasswordController,
          decoration: InputDecoration(
            label: const Text(AppTexts.loginTextFieldHintPassword),
            labelStyle: AppStyles.loginTextFieldHintStyle,
            floatingLabelStyle: AppStyles.loginTextFieldHintStyle,
            suffixIcon: InkWell(
              onTap: () {
                ref.read(forgotPasswordProvider).toggleIsObscure();
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
        ),
      );
    });
  }

  _buildTextFieldConfirmPassword(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          obscureText: ref.watch(forgotPasswordProvider).isObscure,
          controller:
              ref.watch(forgotPasswordProvider).confirmNewPasswordController,
          decoration: InputDecoration(
            label: const Text(AppTexts.confirmPassword),
            labelStyle: AppStyles.loginTextFieldHintStyle,
            floatingLabelStyle: AppStyles.loginTextFieldHintStyle,
            suffixIcon: InkWell(
              onTap: () {
                ref.read(forgotPasswordProvider).toggleIsObscure();
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
        ),
      );
    });
  }

  _buildContinueButton(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.065),
        child: InkWell(
          onTap: () async {
            Navigator.of(context).push<void>(
              CupertinoPageRoute<void>(
                  builder: (BuildContext context) =>
                      const VerifyingForgotPasswordOTPView()),
            );
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
                AppTexts.forgotPasswordContinue,
                style: AppStyles.forgotPasswordButtonStyle,
              ),
            ),
          ),
        ),
      );
    });
  }
}
