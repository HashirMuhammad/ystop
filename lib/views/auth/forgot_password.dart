// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ystop_mystop/core/app/colors.dart';
// import 'package:ystop_mystop/core/app/images.dart';
// import 'package:ystop_mystop/core/app/styles.dart';
// import 'package:ystop_mystop/core/app/texts.dart';
// import 'package:ystop_mystop/views/auth/verifying_forgot_password_otp.dart';

// import '../../core/app/svg.dart';
// import '../../core/providers/forgot_password_provider.dart';
// import '../home.dart';
// import '../widgets/example_loading_spinner.dart';

// class ForgotPasswordView extends ConsumerStatefulWidget {
//   const ForgotPasswordView({super.key});

//   @override
//   ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
// }

// class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       key: _scaffoldKey,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryWhite,
//         leading: InkWell(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Icon(
//             Icons.arrow_back_ios,
//             size: 22,
//             color: AppColors.primaryBlackColor,
//           ),
//         ),
//         elevation: 0,
//         title: Text(
//           AppTexts.forgotPassword,
//           style: AppStyles.forgotPasswordHeadingStyle,
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: size.height * 0.04,
//             ),
//             Image.asset(
//               AppImages.forgotPasswordImage,
//               height: size.height * 0.2,
//               width: size.width * 0.33,
//             ),
//             SizedBox(
//               height: size.height * 0.04,
//             ),
//             Text(
//               AppTexts.forgotPasswordText,
//               style: AppStyles.forgotPasswordTextStyle,
//             ),
//             _buildTextFieldEmail(context),
//             SizedBox(
//               height: size.height * 0.04,
//             ),
//             _buildContinueButton(context),
//           ],
//         ),
//       ),
//     );
//   }

//   _buildTextFieldEmail(BuildContext context) {
//     return Consumer(
//       builder: (BuildContext context, WidgetRef ref, Widget? child) {
//         return Padding(
//           padding: EdgeInsets.only(
//             left: MediaQuery.of(context).size.width * 0.1,
//             top: MediaQuery.of(context).size.height * 0.02,
//           ),
//           child: TextFormField(
//             controller:
//                 ref.watch(forgotPasswordProvider).forgotPasswordEmailController,
//             decoration: InputDecoration(
//               label: const Text(AppTexts.forgotPasswordEmailAddress),
//               labelStyle: AppStyles.loginTextFieldHintStyle,
//               floatingLabelStyle: AppStyles.loginTextFieldHintStyle,
//               border: InputBorder.none,
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: SvgPicture.asset(
//                   AppSvg.forgotPasswordEmailSvg,
//                   height: 20,
//                   width: 20,
//                 ),
//               ),
//               isDense: true,
//             ),
//             cursorColor: AppColors.mainThemeColor,
//           ),
//         );
//       },
//     );
//   }

//   _buildContinueButton(BuildContext context) {
//     return Consumer(
//         builder: (BuildContext context, WidgetRef ref, Widget? child) {
//       return Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * 0.065),
//         child: InkWell(
//           onTap: () async {
//             Navigator.of(context).push<void>(
//               CupertinoPageRoute<void>(
//                   builder: (BuildContext context) =>
//                       const VerifyingForgotPasswordOTPView()),
//             );
//           },
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.075,
//             width: MediaQuery.of(context).size.width * 0.5,
//             decoration: BoxDecoration(
//               color: AppColors.mainThemeColor,
//               borderRadius: BorderRadius.circular(47),
//             ),
//             child: Center(
//               child: Text(
//                 AppTexts.forgotPasswordContinue,
//                 style: AppStyles.forgotPasswordButtonStyle,
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
