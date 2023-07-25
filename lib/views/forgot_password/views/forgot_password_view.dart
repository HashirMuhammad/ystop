import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';

import '../../../core/app/colors.dart';
import '../../../core/app/images.dart';
import '../../../core/app/styles.dart';
import '../../../core/app/svg.dart';
import '../../../core/app/texts.dart';
import '../../auth/verifying_forgot_password_otp.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(context: context, title: AppTexts.forgotPassword),
      body: GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (_)=> Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Image.asset(
                AppImages.forgotPasswordImage,
                height: size.height * 0.2,
                width: size.width * 0.33,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Text(
                AppTexts.forgotPasswordText,
                style: AppStyles.forgotPasswordTextStyle,
              ),
              _buildTextFieldEmail(context),
              SizedBox(
                height: size.height * 0.04,
              ),
              _buildContinueButton(context),
            ],
          ),
        ),
      ),
    );
  }

  
  _buildTextFieldEmail(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.02,
          ),
          child: TextFormField(
            controller: controller.forgotPasswordEmailController,
            decoration: InputDecoration(
              label: const Text(AppTexts.forgotPasswordEmailAddress),
              labelStyle: AppStyles.loginTextFieldHintStyle,
              floatingLabelStyle: AppStyles.loginTextFieldHintStyle,
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  AppSvg.forgotPasswordEmailSvg,
                  height: 20,
                  width: 20,
                ),
              ),
              isDense: true,
            ),
            cursorColor: AppColors.mainThemeColor,
          ),
        );
      },
    );
  }

  _buildContinueButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.065),
        child: InkWell(
          onTap: () async {
            Get.to(VerifyingForgotPasswordOTPView());
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
  }
}