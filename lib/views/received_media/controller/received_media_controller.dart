import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveMediaController extends GetxController with ReceiveMediaInitializer,ReceiveMediaListingInitializer,BottomSheetinitializer{
 
}

mixin ReceiveMediaInitializer{

}
mixin ReceiveMediaListingInitializer{
 final TextEditingController quantitity1TextEditingController = TextEditingController();
  final TextEditingController quantitity2TextEditingController = TextEditingController();

 final TextEditingController quantitity3TextEditingController = TextEditingController();

 final TextEditingController quantitity4TextEditingController = TextEditingController();

}

mixin BottomSheetinitializer{
  TextEditingController numberTextEditingController = TextEditingController();

}