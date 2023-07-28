import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';
import 'package:ystop_mystop/routes.dart';
import 'package:ystop_mystop/views/move_media/controller/move_media_controller.dart';
import '../../../core/app/images.dart';
import '../../../core/app/texts.dart';
import '../../../core/widgets/custom_text_field.dart';


class MoveMediaDetailPage extends GetView<MoveMediaController>{
  const MoveMediaDetailPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(context: context,title: AppTexts.detail,),
      body: GetBuilder<MoveMediaController>(
        init: MoveMediaController(),
        builder: (_){
          return LayoutBuilder(
          builder:  (BuildContext context,BoxConstraints constraints) =>  Padding(
            padding: const EdgeInsets.symmetric(horizontal:15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
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
              Row(
                children: [
                  Expanded(
                    flex: 50,
                    child: _pigeonHoleListTextFields(textEditingController: controller.quantitity1TextEditingController)),
                    const SizedBox(width: 6,),
                  Expanded(
                      flex: 50,
                    child: _pigeonHoleListTextFields(textEditingController: controller.quantitity2TextEditingController)),

                ],
              ),
                    const SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                      flex: 50,
                    child: _pigeonHoleListTextFields(textEditingController: controller.quantitity3TextEditingController)),
                     const SizedBox(width: 6,),
                  Expanded(
                      flex: 50,
                    child: _pigeonHoleListTextFields(textEditingController: controller.quantitity4TextEditingController)),

                ],
              )
                ],
               ),
             ),
             Expanded(child: Container()),
         Align(
          alignment: Alignment.bottomCenter,
          child: _submitButton()),
          SizedBox(height: constraints.maxHeight * 0.08,),
      
              ],
            ),
          ));
        },
    
      ));
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
            "Title here",
            style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6,),
          Text(
            "Company name",
            style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6,),
          Text(
            "Brand: kFC",
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
  ],
);

  
 }

 Widget _pigeonHoleListTextFields( {required TextEditingController textEditingController}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
   children: [
      Text("Pigeonhole ID",style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500,fontSize: 19),),
      SizedBox(height: 10,),
      CustomTextField(controller : textEditingController, hintText: "Enter Quantity"),

   ],
  );
 }

 Widget _submitButton(){
  return CustomButtonWidget(onPressed: (){
    //controller.moveMediaSubmitBtn();
    //Get.toNamed(AppRoutes.moveMediaListingPage);
  },text: "Submit",);
 }
}