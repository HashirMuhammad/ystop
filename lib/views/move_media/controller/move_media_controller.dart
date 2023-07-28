



import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/app/snackbar.dart';
import '../../../core/app/texts.dart';
import '../model/destination_pigeonhole_model.dart';
import '../model/get_move_media_location.dart';
import '../model/move_media_scan_qr_code.dart';
import '../repository/move_media_repository.dart';

enum MoveMediaLoadingType {parent,hide}

class MoveMediaController extends GetxController with MoveMediaListingPageInitializer,MoveMediaDetailPageInitializer{


  @override
  void onInit() {
      Map<String, dynamic> environment = {
    //'environment': 'dev', 
      'base_url': 'https://assets-dev.ystop.com.au', 
     };

     moveMediaRepository = MoveMediaRepository(environment);
  //   moveMedia();
     init();

    super.onInit();
  }


   void init() async{
   await getMediaLocation();
   }

  @override
  Future<void> moveMedia() async{
   isLoading.value = MoveMediaLoadingType.parent;
    try{
       dynamic reponse = await moveMediaRepository.moveMediaScanQRCode();
       if(reponse !=null){
        mediaScanQrCodeModel  = MovelMediaScanQrCodeModel.fromJson(reponse);

        print(mediaScanQrCodeModel.toJson());

       }

    }
    catch(e){
      e.toString();
    }

   return Future<void>.value(null);
  }
  
    @override
  Future<void> getMediaLocation() async{
    isLoading.value = MoveMediaLoadingType.parent;
    try {
      dynamic response = await moveMediaRepository.getMediaLocations();
      if(response !=null){
        moveMediaLocationsModel = GetMediaLocationsModel.fromJson(response);
        print(moveMediaLocationsModel.toJson());
      } 
      else{
        CustomSnackbar.showError(AppTexts.someThingWentWrong);
      }
    } catch (e) {
      CustomSnackbar.showError(e.toString());

      e.toString();
    }
   finally{
    isLoading.value = MoveMediaLoadingType.hide;
   }
    return Future<void>.value(null);
  }

   void addDestinationPigeoHole({required String qrCode,required int quantity}) {
    DestinationPigeonhole destinationQRCode = DestinationPigeonhole(
      qrCode: qrCode,
      quantity: quantity,
    );
    destinationPigeonholes.add(destinationQRCode);
    update();
  }



   Map<String, dynamic> generateMoveMediaJSON() {

      // Convert the DestinationPigeonhole objects into a List<Map>
    List<Map<String, dynamic>> destinationList = destinationPigeonholes.map((destination) {
      return {
        'qrCode': destination.qrCode,
        'quantity': destination.quantity,
      };
    }).toList();


  moveMediaJson = 
    {
        'source_pigeonhole_qrCode' : sourcePigeonholeQRCode,
     'destination_pigeonhole_qrCodes': destinationList,
    };

    print('moveMediaJson/////////////////////$moveMediaJson');
   
    return moveMediaJson;
   }
   
     @override
     Future<void> moveMediaSubmitBtn() async{
       isLoading.value = MoveMediaLoadingType.parent;
       print("////////////////////////${jsonEncode(moveMediaJson)}");
        try {
      // Map<String, dynamic> receiveMediaRequestBody = moveMediaJson;
      dynamic reponse =
          await moveMediaRepository.moveMediaSubmitBtnApi(jsonEncode(moveMediaJson));

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
      isLoading.value = MoveMediaLoadingType.hide;
    }
    return Future<void>.value(null);

     }
}

mixin MoveMediaListingPageInitializer{

}
mixin MoveMediaDetailPageInitializer{
 final TextEditingController quantitity1TextEditingController = TextEditingController();
  final TextEditingController quantitity2TextEditingController = TextEditingController();

 final TextEditingController quantitity3TextEditingController = TextEditingController();

 final TextEditingController quantitity4TextEditingController = TextEditingController();
  final TextEditingController numberTextEditingController = TextEditingController();



/// API'S
 
 Future<void> moveMedia();

 Future<void> getMediaLocation();


 /// on submit btn
 Future<void> moveMediaSubmitBtn();


 final Rx<MoveMediaLoadingType> isLoading = MoveMediaLoadingType.hide.obs;

  late MoveMediaRepository moveMediaRepository;

  MovelMediaScanQrCodeModel  mediaScanQrCodeModel = MovelMediaScanQrCodeModel ();

  GetMediaLocationsModel moveMediaLocationsModel = GetMediaLocationsModel();

    QRViewController? qrViewController;

    String? sourcePigeonholeQRCode ;
   String? destinationPigeoHole;

List<DestinationPigeonhole> destinationPigeonholes = [];
Map<String, dynamic> moveMediaJson = {};
}