import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/snackbar.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/views/received_media/model/get_media_file.dart';
import 'package:ystop_mystop/views/received_media/model/get_media_locations.dart';

import '../../../routes.dart';
import '../repository/receive_media_repository.dart';

enum ReceiveMediaLoadingType { parent, hide }

class ReceiveMediaController extends GetxController  with ReceiveMediaInitializer,  GetMediaLocationsInitializer, BottomSheetinitializer {
  @override
  void onInit() {
    Map<String, dynamic> environment = {
      //'environment': 'dev',
      'base_url': 'https://assets-dev.ystop.com.au',
    };

    receiveMediaRepository = ReceiveMediaRepository(environment);
    super.onInit();
  }



  // @override
  // Future<void> getMediaLocations() async{
  //   isLoading.value = ReceiveMediaLoadingType.parent;
  //   try {
  //     dynamic response = await receiveMediaRepository.getMediaLocations();
  //     if(response !=null){
  //       getMediaLocationsModel = GetMediaLocationsModel.fromJson(response);
  //       print(getMediaLocationsModel.toJson());
  //       Get.toNamed(AppRoutes.receivedMediaListingPage);
  //     } 
  //     else{
  //       CustomSnackbar.showError(AppTexts.someThingWentWrong);
  //     }
  //   } catch (e) {
  //     CustomSnackbar.showError(e.toString());

  //     e.toString();
  //   }
  //  finally{
  //   isLoading.value = ReceiveMediaLoadingType.hide;
  //  }
  //   return Future<void>.value(null);
  // }
  
  @override
  Future<void> getReceiveMediaFile() async{
      isLoading.value = ReceiveMediaLoadingType.parent;
    try {
      dynamic response = await receiveMediaRepository.getMediaFile();
      if(response !=null){
        getMediaFileModel = GetMediaFileModel.fromJson(response);
        print(getMediaFileModel.toJson());
          Get.toNamed(AppRoutes.receivedMediaVerificationPage);
      } 
      else{
        CustomSnackbar.showError(AppTexts.someThingWentWrong);
      }
    } catch (e) {
      CustomSnackbar.showError(e.toString());

      e.toString();
    }
   finally{
    isLoading.value = ReceiveMediaLoadingType.hide;
   }

 return Future<void>.value(null);
  }

     @override
     Future<void> receiveMediaSubmitBtn() async{
       isLoading.value = ReceiveMediaLoadingType.parent;
        try {
      // Map<String, dynamic> receiveMediaRequestBody = moveMediaJson;
      dynamic reponse =
          await receiveMediaRepository.receiveMediaSubmit(jsonEncode(receiveMediaJson));

          print('response/////////////////////////////////$reponse');
      // if (reponse != null) {
      //   if (reponse['message'] == 'Success') {
      //     CustomSnackbar.showSuccess('Success');
      //   } else if (reponse['message'] == 'The given data was invalid.') {
      //     CustomSnackbar.showError('The given data was invalid.');
      //   }
      // }
    } catch (e) {
      print(e.toString());
      e.toString();
    } finally {
      isLoading.value = ReceiveMediaLoadingType.hide;
    }
    return Future<void>.value(null);

     }



String generateReceiveMediaJSON() {
  // Create a new map with the key "qrCodes" and its value as the list of scanned pigeonholes
  receiveMediaJson = {
    'qrCodes': scannedPigeonholes,
  };
  print(jsonEncode(receiveMediaJson));
  return jsonEncode(receiveMediaJson);
}





}

mixin ReceiveMediaInitializer {}
mixin GetMediaLocationsInitializer {
  final TextEditingController quantitity1TextEditingController =
      TextEditingController();
  final TextEditingController quantitity2TextEditingController =
      TextEditingController();

  final TextEditingController quantitity3TextEditingController =
      TextEditingController();

  final TextEditingController quantitity4TextEditingController =
      TextEditingController();

  /// loading

  final Rx<ReceiveMediaLoadingType> isLoading =
      ReceiveMediaLoadingType.hide.obs;

  /// API'S
  
    Future<void> getReceiveMediaFile();


  Future<void> receiveMediaSubmitBtn();

  /// call on yes of verification page

 // Future<void> getMediaLocations();



  late ReceiveMediaRepository receiveMediaRepository;

  GetMediaLocationsModel getMediaLocationsModel = GetMediaLocationsModel();
  GetMediaFileModel getMediaFileModel =GetMediaFileModel();


  RxString totalPigeonholeScanned = ''.obs;
}

mixin BottomSheetinitializer {
  TextEditingController numberTextEditingController =
      TextEditingController();


      /// list which have scanned pigeon holes along with quantity
         List<Map<String, dynamic>> scannedPigeonholes = [];
 Map<String, dynamic> receiveMediaJson = {};
}
