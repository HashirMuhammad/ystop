import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/routes.dart';
import 'package:ystop_mystop/views/auth/verifying_forgot_password_otp.dart';
import 'package:ystop_mystop/views/destroy_media/views/destroy_media_listing.dart';
import 'package:ystop_mystop/views/destroy_media/views/destroy_media_scan_qr_code_page.dart';
import 'package:ystop_mystop/views/forgot_password/views/forgot_password_view.dart';
import 'package:ystop_mystop/views/home/views/home_view.dart';
import 'package:ystop_mystop/views/move_media/views/move_media_detail.dart';
import 'package:ystop_mystop/views/move_media/views/move_media_listing.dart';
import 'package:ystop_mystop/views/move_media/views/move_media_scan_qr_page.dart';
import 'package:ystop_mystop/views/received_media/views/received_media_listing.dart';
import 'package:ystop_mystop/views/received_media/views/received_media_scan_qr_page.dart';
import 'package:ystop_mystop/views/received_media/views/received_media_verification_page.dart';

import 'views/login/views/login_view.dart';

void main() {
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> appRoutes = {
      AppRoutes.login: (context) => const LoginView(),
      AppRoutes.home: (context) => const HomeView(),
      // AppRoutes.forgotPassword: (context) => const ForgotPasswordView(),
      AppRoutes.receivedMediaScanQr: (context) => const ReceiveMediaScanQRPage(),
      AppRoutes.verifiyingForgotPasswordOTP: (context) =>
          const VerifyingForgotPasswordOTPView(),
      AppRoutes.receivedMediaVerificationPage: (context) =>
          const ReceivedMediaVerificationPage(),
      AppRoutes.receivedMediaListingPage: (context) =>
          const ReceivedMediaListing(),
      AppRoutes.moveMediaDetailPage: (context) => const MoveMediaDetailPage(),
      AppRoutes.moveMediaListingPage: (context) => const MoveMediaListing(),
       AppRoutes.destroyMediaListingPage: (context) => const DestroyMediaListing(),
       AppRoutes.moveMediaScanQrPage: (context) => const MoveMediaMediaScanQRPage(),
       AppRoutes.destroyMediaScanQrPage: (context) => const DestroyMediaScanQRPage(),

       AppRoutes.forgotPasswordPage: (context) => const ForgotPasswordView(),

    };

    return GetMaterialApp(
      title: 'yStop MyStop',
      debugShowCheckedModeBanner: false,
      // Update app theme data here
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      //  routes: Routes.routes,
      //   getPages: AppPages.pages,
      initialRoute: AppRoutes.login,
    );
  }
}
