import 'package:get/get.dart';

import 'colors.dart';

class CustomSnackbar {
  static void showError(String message) {
    if(!Get.isSnackbarOpen){
   Get.snackbar(
      'Error',
      message,
      backgroundColor: AppColors.redColor,
      colorText: AppColors.primaryWhite,
      duration: Duration(seconds: 2),
    );
    }
   
  }

  static void showSuccess(String message) {
    if(!Get.isSnackbarOpen){
    Get.snackbar(
      'Success',
      message,
      backgroundColor: AppColors.mainThemeColor,
      colorText: AppColors.primaryWhite,
      duration: Duration(seconds: 2),
    );
  }
  }
}
