import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/snackbar.dart';

import '../../../routes.dart';
import '../repository/receive_media_repository.dart';



enum ReceiveMediaLoadingType {parent,hide}


class ReceiveMediaController extends GetxController with ReceiveMediaInitializer,ReceiveMediaListingInitializer,BottomSheetinitializer{


  @override
  void onInit() {
      Map<String, dynamic> environment = {
    //'environment': 'dev', 
      'base_url': 'https://assets-dev.ystop.com.au', 
     };

     receiveMediaRepository = ReceiveMediaRepository(environment);
    super.onInit();
  }

  @override
  Future<void> receiveMedia() async{

        isLoading.value = ReceiveMediaLoadingType.parent;
         try{
          Map<String,dynamic> receiveMediaRequestBody =  <String,dynamic> {
            'qrCodes': [
        {
            'qrCode': 'OSB1',
            'quantity': int.parse(numberTextEditingController.text)
        },
        {
            'qrCode': 'OSB2',
            'quantity': int.parse(numberTextEditingController.text)
        }
    ]        
          };
         dynamic reponse = await receiveMediaRepository.receiveMedia(receiveMediaRequestBody);
         if(reponse != null){
          if (reponse['message'] == 'Success') {
             Get.toNamed(AppRoutes.receivedMediaVerificationPage);
            CustomSnackbar.showSuccess('Success');
          }
          else if(reponse['message'] == 'The given data was invalid.'){
            CustomSnackbar.showError('The given data was invalid.');
          }

         }

        }

     catch(e){
      
         print(e.toString());
          e.toString();
     }
  
    finally{
        isLoading.value = ReceiveMediaLoadingType.hide;

    }
   return Future<void>.value(null);
  }
 
}

mixin ReceiveMediaInitializer{

}
mixin ReceiveMediaListingInitializer{
 final TextEditingController quantitity1TextEditingController = TextEditingController();
  final TextEditingController quantitity2TextEditingController = TextEditingController();

 final TextEditingController quantitity3TextEditingController = TextEditingController();

 final TextEditingController quantitity4TextEditingController = TextEditingController();





 /// loading
 
 final Rx<ReceiveMediaLoadingType> isLoading = ReceiveMediaLoadingType.hide.obs;

 
/// API'S
 
 Future<void> receiveMedia();
  late ReceiveMediaRepository receiveMediaRepository;


}

mixin BottomSheetinitializer{
  TextEditingController numberTextEditingController = TextEditingController(text: '2');






}