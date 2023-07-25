import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/views/move_media/repository/move_media_repository.dart';

import '../model/move_media_scan_qr_code.dart';



enum MoveMediaLoadingType {parent,hide}

class MoveMediaController extends GetxController with MoveMediaListingPageInitializer,MoveMediaDetailPageInitializer{


  @override
  void onInit() {
      Map<String, dynamic> environment = {
    //'environment': 'dev', 
      'base_url': 'https://assets-dev.ystop.com.au', 
     };

     moveMediaRepository = MoveMediaRepository(environment);
     moveMedia();

    super.onInit();
  }


   void init() async{
   await moveMedia();
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

 final Rx<MoveMediaLoadingType> isLoading = MoveMediaLoadingType.hide.obs;

  late MoveMediaRepository moveMediaRepository;

  MovelMediaScanQrCodeModel  mediaScanQrCodeModel = MovelMediaScanQrCodeModel ();
}