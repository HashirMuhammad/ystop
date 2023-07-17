import 'package:get/get.dart';

import 'colors.dart';

class CustomSnackbar {
  static void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: AppColors.redColor,
      colorText: AppColors.primaryWhite,
      duration: Duration(seconds: 2),
    );
  }

  static void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: AppColors.mainThemeColor,
      colorText: AppColors.primaryWhite,
      duration: Duration(seconds: 2),
    );
  }
}
