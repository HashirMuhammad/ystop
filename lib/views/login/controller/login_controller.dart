import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/app_logs.dart';
import 'package:ystop_mystop/core/app/app_preferences.dart';
import 'package:ystop_mystop/core/app/snackbar.dart';
import 'package:ystop_mystop/routes.dart';
import 'package:ystop_mystop/views/login/model/login_model.dart';

import '../repository/login_repository.dart';


enum LoginLoadingType {parent,hide}

class LoginController extends GetxController with LoginInitializer{


 @override
   void onInit() {
     Map<String, dynamic> environment = {
    //'environment': 'dev', 
      'base_url': 'https://assets-dev.ystop.com.au', 
     };

     loginRepository = LoginRepository(environment);
     super.onInit();
  }




  @override
  Future<void> loginUser() async{
     
     isLoading.value = LoginLoadingType.parent;
     try{

       Map<String, dynamic> loginRequestBody = <String, dynamic>{
        'email': emailTextEditingController.text,
        'password': passwordTextEditingController.text,
      };
      dynamic reponse = await loginRepository.login(loginRequestBody);
      if (reponse != null) {
       final LoginModel loginModel = LoginModel.fromJson(reponse);
        AppPreferences.saveAuthenticationData(loginModel);
       //  print(loginModel.toJson());
        Get.offNamed(AppRoutes.home);

        CustomSnackbar.showSuccess('User logged in successfully!');

      }
      else{
        CustomSnackbar.showError('Something went wrong');
      }
     }
     catch(e){
       if (e.toString().contains('unauthorized' ) || e.toString().contains('Unauthorized' ) || e.toString().contains(' Access denied')) {
      CustomSnackbar.showError('Invalid email or password');
       } else {
      CustomSnackbar.showError('An error occurred: $e');
      }
        //  CustomSnackbar.showError(e.toString());
         print(e.toString());
          e.toString();
     }
  
    finally{
        isLoading.value = LoginLoadingType.hide;

    }
    return Future<void>.value(null);
  }

  // Map<String, dynamic> loginRequestBody = <String , dynamic >{
  //   'email' : emailTextEditingController.text,
  //   'password' :''
  // };

}

mixin LoginInitializer{

 final TextEditingController emailTextEditingController = TextEditingController(text: 'zee@matter.city');
  final TextEditingController passwordTextEditingController = TextEditingController(text: 'moz123');


  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


 final RxBool isRememberMe =  false.obs;


 LoginModel loginModel = LoginModel();
 late LoginRepository loginRepository;

 Future <void> loginUser();

 /// loading
 
 final Rx<LoginLoadingType> isLoading = LoginLoadingType.hide.obs;

}