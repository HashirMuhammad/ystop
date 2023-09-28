

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherMaintenseController extends GetxController{
  final searchController = TextEditingController();
  RxBool checkBoxOne = false.obs;
  RxBool checkBoxTwo = false.obs;
  RxBool checkBoxThree = false.obs;
  RxBool checkBoxFour = false.obs;
  RxString checkBoxOneText = "Item 01....".obs;
}