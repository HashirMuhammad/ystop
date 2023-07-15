import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoveMediaController extends GetxController with MoveMediaListingPageInitializer,MoveMediaDetailPageInitializer{
 
}

mixin MoveMediaListingPageInitializer{

}
mixin MoveMediaDetailPageInitializer{
 final TextEditingController quantitity1TextEditingController = TextEditingController();
  final TextEditingController quantitity2TextEditingController = TextEditingController();

 final TextEditingController quantitity3TextEditingController = TextEditingController();

 final TextEditingController quantitity4TextEditingController = TextEditingController();
  final TextEditingController numberTextEditingController = TextEditingController();


}