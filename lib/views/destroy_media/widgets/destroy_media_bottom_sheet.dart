import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/snackbar.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';
import 'package:ystop_mystop/views/destroy_media/controller/destroy_media_controller.dart';
import 'package:ystop_mystop/views/move_media/model/get_move_media_location.dart';

import '../../../core/widgets/custom_text_field.dart';
import 'destroy_media_confirmation_bottom_sheet.dart';

class DestroyMediaBottomSheet extends GetView<DestroyMediaController> {
  final Stock destroyMediaStock;
  const DestroyMediaBottomSheet({required this.destroyMediaStock, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
        controller.selectedIndex.value = -1;
    controller.quantitityTextEditingController = TextEditingController();
         controller.onTapDestroyMedia.value  = false;

         return true;
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
            ),
          ),
          height: constraints.maxHeight * 0.35,
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      AppTexts.destroyMedia,
                      style: AppStyles.textStyleCustom.copyWith(fontSize: 22),
                    ),
                    InkWell(
                      onTap: (){
                          controller.selectedIndex.value = -1;
    
                        controller.onTapDestroyMedia.value  = false;
                            controller.quantitityTextEditingController = TextEditingController();

                        Get.back();
                      },
                      child: const Icon(Icons.clear))
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded( // Added Expanded widget
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            'Pigeonhole ${destroyMediaStock.pigeonholeId}',
                           // AppTexts.pigeonHoleID,
                            style: AppStyles.textStyleCustom.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: controller.quantitityTextEditingController,
                        hintText: "Enter Quantity",
                        onChanged: (val){
                          controller.quantitityTextEditingController.text = val;
                        },
                      
                      ),
                      SizedBox(height: 20), // Added space after text field
                      Expanded(child: Container()), // Space filler

                      if(MediaQuery.of(context).viewInsets.bottom == 0)
                      _destroyMediaButton( stockQuantity: destroyMediaStock.quantity!, stock: destroyMediaStock),
                       if(MediaQuery.of(context).viewInsets.bottom == 0)
                       SizedBox(height: 25),  
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _destroyMediaButton({required int stockQuantity,required Stock stock}) {
    return CustomButtonWidget(
      text: AppTexts.destroy,
      onPressed: () {
           if (controller.quantitityTextEditingController.text.isEmpty) {
            CustomSnackbar.showError('Enter quantity of media you want to destroy');
        } else if (int.parse(controller.quantitityTextEditingController.text) > stockQuantity) {
          CustomSnackbar.showError('The maximum quantity of this media in stock is $stockQuantity');
          } else {
            
            controller.destroyMediaJson(stock.qrCode.toString(), int.parse(controller.quantitityTextEditingController.text));
           controller.destroyMediaRequestBody  =   controller.destroyMediaJson(stock.qrCode.toString(), int.parse(controller.quantitityTextEditingController.text));
          

        Get.back();

        Get.bottomSheet(
          DestroyMediaConfirmationBottomSheet(),
          isDismissible: false,
          enableDrag: false);
       }

       
      },
      backgroundColor: AppColors.redColor,
    );
  }
}
