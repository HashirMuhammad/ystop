import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';
import 'package:ystop_mystop/views/destroy_media/controller/destroy_media_controller.dart';

import '../../../core/app/styles.dart';
import '../../../core/widgets/custom_dialog_widget.dart';


class DestroyMediaConfirmationBottomSheet extends GetView<DestroyMediaController> {
  const DestroyMediaConfirmationBottomSheet({Key? key}) : super(key: key);

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
          height: constraints.maxHeight * 0.55,
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                  const SizedBox(height: 20),
                 const Icon(Icons.warning_amber_outlined,size: 40),
                  const SizedBox(height: 10),
                  Text(
                        AppTexts.confirmation,
                        style: AppStyles.textStyleCustom.copyWith(fontSize: 22),
                      ),
                  const SizedBox(height: 20),
                       Text(
                    AppTexts.destroyMediaConfrimation,
                  
                  style: AppStyles.exampleTextstyle.copyWith(fontSize: 18,
                  color: AppColors.primaryBlackColor,
                  fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                  ),
                  Expanded(child: Container()),
                  _verificationButtons(),
                      SizedBox(height: 25),  
    
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _verificationButtons(){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     CustomButtonWidget(onPressed: () {
       controller.selectedIndex.value = -1;
    controller.quantitityTextEditingController = TextEditingController();
         controller.onTapDestroyMedia.value  = false;
      Get.back();
     }, text: AppTexts.no,backgroundColor: AppColors.primaryWhite,textColor: AppColors.primaryBlackColor,),
     const SizedBox(width: 5,),
          CustomButtonWidget(onPressed: () async{
    //      await  controller.destroyMediaaOnConfirmation();
    
        Get.back();
       controller.selectedIndex.value = -1;
    controller.quantitityTextEditingController = TextEditingController();
         controller.onTapDestroyMedia.value  = false;
          Get.dialog(
            CustomDialogWidget(title: 'Media destroyed successfully',onPressed: (){
              Get.back();
            },)
          );
          }, text: AppTexts.yes),

    ],
  );
 }
}
