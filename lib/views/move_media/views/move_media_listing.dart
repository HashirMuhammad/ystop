import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/views/move_media/controller/move_media_controller.dart';

import '../../../core/app/colors.dart';
import '../../../core/app/images.dart';
import '../../../core/app/texts.dart';
import '../../../core/widgets/custom_appbar.dart';

class MoveMediaListing extends GetView<MoveMediaController> {
  const MoveMediaListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(context: context,title: AppTexts.moveMedia,),

      body: LayoutBuilder(
          builder:  (BuildContext context,BoxConstraints constraints) =>  Padding(
            padding: const EdgeInsets.symmetric(horizontal:15),
            child: Column(
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
            ),
          )),);
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

Widget _pigeonHoleListing(){
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 4,
    itemBuilder: (BuildContext context, int index){
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
       child: Container(
        decoration: BoxDecoration(
                          color: AppColors.blueColor.withOpacity(0.01),
                          borderRadius: BorderRadius.all(const Radius.circular(14))
                        ),
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 16),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text("Pigeonhole 0${index+1}",style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500,fontSize: 19),),
             const SizedBox(height: 5,),
              Text("Quantity 02",style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500,fontSize: 17),),
              
              
            ],
           ),
         ),
       ),
     );
  });
}

 }