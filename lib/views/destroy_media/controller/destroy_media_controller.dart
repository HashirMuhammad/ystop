import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/views/destroy_media/repository/destroy_media_repository.dart';
import '../../../core/app/snackbar.dart';
import '../../../core/app/texts.dart';
import '../../move_media/model/get_move_media_location.dart';



enum DestroyMediaLoadingType { parent, hide }

class DestroyMediaController extends GetxController with DestroyMediaInitializer{
 

  @override
  void onInit() {
      Map<String, dynamic> environment = {
    //'environment': 'dev', 
      'base_url': 'https://assets-dev.ystop.com.au', 
     };

     destroyMediaRepository = DestroyMediaRepository(environment);
  //   moveMedia();
     init();

    super.onInit();
  }


   void init() async{
   await getMediaLocation();
   }
 @override
  Future<void> getMediaLocation() async{
      isLoading.value = DestroyMediaLoadingType.parent;
    try {
      dynamic response = await destroyMediaRepository.getMediaLocations();
      if(response !=null){
        getMediaLocationsModel = GetMediaLocationsModel.fromJson(response);
        print(getMediaLocationsModel.toJson());
        //  Get.toNamed(AppRoutes.receivedMediaVerificationPage);
      } 
      else{
        CustomSnackbar.showError(AppTexts.someThingWentWrong);
      }
    } catch (e) {
      CustomSnackbar.showError(e.toString());

      e.toString();
    }
   finally{
    isLoading.value = DestroyMediaLoadingType.hide;
   }

 return Future<void>.value(null);
  }


String  destroyMediaJson(String qrCode, int quantity) {
  return json.encode({
    'qrCode': qrCode,
    'quantity': quantity,
  });
}


 /// delete media on confirmation

  @override
  Future<void> destroyMediaaOnConfirmation() async{
      isLoading.value = DestroyMediaLoadingType.parent;
    try{
           dynamic response = await destroyMediaRepository.destroyMediaOnConfirmation(destroyMediaRequestBody!);
           if(response!=null){

           }

    }
    catch(e){
     CustomSnackbar.showError(e.toString());

      e.toString();
    }
    finally{
      isLoading.value = DestroyMediaLoadingType.hide;
    }


     return Future<void>.value(null);

  }


}


mixin DestroyMediaInitializer{
  TextEditingController quantitityTextEditingController = TextEditingController();
 
  TextEditingController numberTextEditingController = TextEditingController();
   Rx<DestroyMediaLoadingType> isLoading =  DestroyMediaLoadingType.hide.obs;
   late DestroyMediaRepository destroyMediaRepository;
  GetMediaLocationsModel getMediaLocationsModel = GetMediaLocationsModel();
      Future<void> getMediaLocation();




RxBool onTapDestroyMedia = false.obs;
RxInt selectedIndex = RxInt(-1);


/// destroy media request;
Map<String, dynamic> destroyMediaRequest = {};
String? destroyMediaRequestBody;
 


 Future <void> destroyMediaaOnConfirmation();
}