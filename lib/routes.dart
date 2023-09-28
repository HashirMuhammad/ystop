import 'package:flutter/material.dart';
import 'package:ystop_mystop/views/auth/verifying_forgot_password_otp.dart';




class AppRoutes {
 static const String login = '/login';
  static const String home = '/home';
  static const String forgotPassword = '/forgotPassword';
  static const String verifiyingForgotPasswordOTP =   '/verifiyingForgotPasswordOTP';
 // Received Media
  static const String receivedMediaScanQr = '/receivedMediaScanQr';

  static const String receivedMediaVerificationPage = '/receivedMediaVerificationPage';
  static const String receivedMediaListingPage = '/receivedMediaListingPage';

  /// move media
   static const String moveMediaListingPage = '/moveMediaListingPage';
  static const String moveMediaDetailPage = '/moveMediaDetailPage';
    static const String moveMediaScanQrPage = '/moveMediaScanQrPage';


  /// destroy media
    static const String destroyMediaListingPage = '/destroyMediaListingPage';
        static const String destroyMediaScanQrPage = '/destroyMediaScanQrPage';


        /// forgot password
        static const String forgotPasswordPage = '/forgotPasswordPage';
        //MainSelection
        static const String mainSelectionPage = '/mainSelectionPage';
        //postingMedia
        static const String postingMedia = '/postingMediaPages';
        //joblist id
        static const String joblistidpage = '/joblistidpage';
 // employCounterPage
        static const String employCounterPage = '/employCounterPage';
        static const String mediaAfterAccept = '/mediaAfterAccept';
        static const String genericScanView = '/genericScanView';
        static const String positionMediaListView = '/positionMediaListView';

 ///postedMedia
 static const String postedMediaPage = '/postedMediaPage';
 static const String otherMaintenancePage = '/otherMaintenancePage';
 static const String viewAssetProgressView = '/viewAssetProgressView';
 static const String createMaintenseView = '/createMaintenseView';
}


class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String forgotPassword = '/forgotPassword';
  static const String verifiyingForgotPasswordOTP =
      '/verifiyingForgotPasswordOTP';


     

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
   // login: (BuildContext context) => const LoginView(),
 //   home: (BuildContext context) => const HomeView(),
    //forgotPassword: (BuildContext context) => const ForgotPasswordView(),
    verifiyingForgotPasswordOTP: (BuildContext context) =>
        const VerifyingForgotPasswordOTPView(),
  };
}
