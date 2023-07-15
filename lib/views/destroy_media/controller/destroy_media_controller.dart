import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestroyMediaController extends GetxController with DestroyMediaListingInitializer,DestroyMediaDetailPageInitializer{
 
}

mixin DestroyMediaListingInitializer{

}
mixin DestroyMediaDetailPageInitializer{
 final TextEditingController quantitityTextEditingController = TextEditingController();
 
  TextEditingController numberTextEditingController = TextEditingController();

}