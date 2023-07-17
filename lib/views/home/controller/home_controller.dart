import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/app_preferences.dart';
import 'package:ystop_mystop/views/login/model/login_model.dart';

class HomeController extends GetxController with HomeControllerInitializer{
 @override
  void onInit() {
    loginModel = AppPreferences.getAuthenticationData();
    print(loginModel);
    super.onInit();
  }
}

class HomeControllerInitializer{

    LoginModel? loginModel;

}