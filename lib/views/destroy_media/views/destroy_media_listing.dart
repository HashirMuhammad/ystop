import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/widgets/loading_widget.dart';
import 'package:ystop_mystop/views/destroy_media/controller/destroy_media_controller.dart';
import 'package:ystop_mystop/views/destroy_media/widgets/destroy_media_bottom_sheet.dart';
import 'package:ystop_mystop/views/move_media/model/get_move_media_location.dart';
import '../../../core/app/colors.dart';
import '../../../core/app/images.dart';
import '../../../core/app/texts.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/qr_code_scanner_widget.dart';


class DestroyMediaListing extends GetView<DestroyMediaController> {
  const DestroyMediaListing({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        controller.selectedIndex.value = -1;

         controller.onTapDestroyMedia.value  = false;

         return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
       appBar: CustomAppBar(context: context,title: AppTexts.destroyMedia,onLeadingPressed: (){
           controller.selectedIndex.value = -1;

         controller.onTapDestroyMedia.value  = false;
         Get.back();
       },),
    
        body: LayoutBuilder(
            builder:  (BuildContext context,BoxConstraints constraints) =>  Obx(() =>  Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child:controller.isLoading.value == DestroyMediaLoadingType.hide ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                 Container(
                  decoration:  BoxDecoration(
                     color: AppColors.blueColor.withOpacity(0.01),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14)
                    )
                  ),
                 
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: _listTileInfoWidget(constraints),
                  )),
                 const SizedBox(height: 40,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal :15),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(AppTexts.pigeonholeList,style: AppStyles.textStyleCustom.copyWith(fontSize: 22),),
                      const SizedBox(height: 30,),
                     _pigeonHoleListing()
                 
                    ],
                   ),
                 ),
                  ],
                ):
                LoadingWidget(),
              ),
            )),),
    );
  }


  Widget _listTileInfoWidget(BoxConstraints constraints){
  return Row(
  children: [
    Container(
      width: constraints.maxWidth *0.20,
      height: constraints.maxHeight * 0.1,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Image.asset(
        AppImages.verificationImage,
        fit: BoxFit.fill,
      ),
    ),
    const SizedBox(width: 8), // Add desired spacing between the leading image and the title column
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            "Company name:",
            style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6,),
          Text(
            "Brand name:",
            style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    SizedBox(
            height: constraints.maxHeight * 0.1,

      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: InkWell(
            onTap: (){
              Get.to(
                QRCodeScannerWidget(numberController: controller.numberTextEditingController,isMoveMedia: true ,onPressedDoneBtn: () {

            //       if(controller.sourcePigeonholeQRCode  != null){
            //    Get.to(
            //     MoveToPigeonHoleQRCodeScannerWidget(numberController: controller.numberTextEditingController, onPressedDoneBtn: () {

                  
            //       if (controller.numberTextEditingController.text.isNotEmpty &&  controller.destinationPigeoHole!.isNotEmpty) {
  
            //            controller.addDestinationPigeoHole(qrCode : controller.destinationPigeoHole! ,quantity: int.parse(controller.numberTextEditingController.text));
            //            controller.generateMoveMediaJSON();
            //            if(controller.moveMediaJson.isNotEmpty){
                        
            //       Get.toNamed(AppRoutes.moveMediaDetailPage);
            //            }
            //         // DestinationPigeonhole(
            //         //   controller.destinationPigeoHoles.toString(),
            //         //   int.parse(controller.numberTextEditingController.text)
            
            //         // );
            //       }
            //       else {
            //         CustomSnackbar.showError('Enter Quantity');
            //       }
            //  //   

            //     },
            //     ),
          
            //     );
            //       }
            //       else{
            //         CustomSnackbar.showError('You have not scanned any source pigeonhole yet.');
            //       }
               
                },
                ),
          
                );
              
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.mainThemeColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  AppImages.scanImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ],
);

}

Widget _pigeonHoleListing(){

  return ListView.builder(
    shrinkWrap: true,
    itemCount: controller.getMediaLocationsModel.data!.stock!.length,
    itemBuilder: (BuildContext context, int index){
        Stock pigeoHoleStockList = controller.getMediaLocationsModel.data!.stock![index];

     return Padding(
       padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
       child: InkWell(
        onTap: (){
            controller.selectedIndex.value = index;

          controller.onTapDestroyMedia.value  = true;
          Get.bottomSheet(
                       DestroyMediaBottomSheet(destroyMediaStock: controller.getMediaLocationsModel.data!.stock![index],),
                      isDismissible: false,
                      isScrollControlled: true,
                      enableDrag: false);
        },
         child: Container(
          decoration: BoxDecoration(
                            color: AppColors.blueColor.withOpacity(0.01),
                            borderRadius: const BorderRadius.all(Radius.circular(14))
                          ),
           child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 16),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text('Pigeonhole ${pigeoHoleStockList.pigeonholeId}',style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500,fontSize: 19),),
                   const SizedBox(height: 5,),
                    Text('Quantity: ${pigeoHoleStockList.quantity}',style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500,fontSize: 17),),
                    
                    
                  ],
                 ),
                           Obx(() {
                       if (controller.selectedIndex.value == index && controller.onTapDestroyMedia.value) {
                      return Image.asset(AppImages.tick);
                      } else {
                       return SizedBox(
                        width: 40,
                       height: 40,
                      child: FittedBox(
                     child: FloatingActionButton(
                      heroTag: "$index",
                    onPressed: () {},
                      backgroundColor: AppColors.mainThemeColor,
                    child: Image.asset(AppImages.scanImage),
        ),
      ),
    );
  }
}),


               
      
           
               ],
             ),
           ),
         ),
       ),
     );
  });
}


// void _onQRViewCreated(QRViewController controller) {

//     controller.qrViewController = controller;


//   controller.scannedDataStream.listen((scanData) {
//     // Handle the scanned QR code data here
//     String qrCode = scanData.code;
//     // Store the scanned QR code in the state or process it as needed
//     // For example, you can use a List to store multiple scanned QR codes.
//     // scannedQRCodeList.add(qrCode);
//   });
// }


 }