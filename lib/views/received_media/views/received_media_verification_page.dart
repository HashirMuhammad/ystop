import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/snackbar.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';
import 'package:ystop_mystop/core/widgets/loading_widget.dart';
import 'package:ystop_mystop/views/received_media/controller/received_media_controller.dart';
import '../../../core/app/colors.dart';
import '../../../core/app/images.dart';
import '../../../core/app/texts.dart';
import '../../../routes.dart';
import '../widgets/receive_media_scanner_widget.dart';

class ReceivedMediaVerificationPage extends GetView<ReceiveMediaController>{
  const ReceivedMediaVerificationPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context,title: AppTexts.receiveMedia,),
      body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints)=> Center(
          child:Obx(() => Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20,),
                Text(AppTexts.verification,style: AppStyles.textStyleCustom.copyWith(fontSize: 22),),
                  const SizedBox(height: 20,),
               Container(
                width: constraints.maxWidth * 0.85,
               height: constraints.maxHeight * 0.5,
               decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10
                  )
                )
               ),
                 child: Image.asset(
                  AppImages.verificationImage,
                //  controller.getMediaFileModel.data!.url!,
                   fit: BoxFit.fill,
              ),
        ),

                
                
                const SizedBox(height: 20,),
              
                Text(
                  AppTexts.areYouSureReceivedMedia,
                style: AppStyles.exampleTextstyle.copyWith(fontSize: 18,
                color: AppColors.primaryBlackColor,
                fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
                ),
                 const SizedBox(height: 20,),
                
                _verificationButtons()
              ]),
              if(controller.isLoading.value  == ReceiveMediaLoadingType.parent)
              const LoadingWidget()
            ],
          )),
        ),
      ),
    );
  }


 Widget _verificationButtons(){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     CustomButtonWidget(onPressed: (){}, text: AppTexts.no,backgroundColor: AppColors.primaryWhite,textColor: AppColors.primaryBlackColor,),
     const SizedBox(width: 5,),
          CustomButtonWidget(onPressed: (){

            Get.to(ReceiveMediaScannerWidget( onPressedDoneBtn: () {
              
                controller.generateReceiveMediaJSON();
                 if(controller.receiveMediaJson['qrCodes'].isNotEmpty){

               Get.toNamed(AppRoutes.receivedMediaListingPage);               }
               else{

                CustomSnackbar.showError('You have to scan pigeon hole and enter the quantity.');
               }

              },));                  //  Get.toNamed(AppRoutes.receivedMediaListingPage);

          //  controller.getMediaLocationsListingAfterVerification();
            
          }, text: AppTexts.yes),

    ],
  );
 }
  
}