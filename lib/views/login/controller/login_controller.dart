import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoginInitializer{

}

mixin LoginInitializer{

 final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();


  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


 final RxBool isRememberMe =  false.obs;

}