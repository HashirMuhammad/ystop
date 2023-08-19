import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';
import '../../../../core/app/colors.dart';
import '../../../../core/app/images.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/svg.dart';
import '../../../../core/app/texts.dart';
import 'select_pigeonhole_bottom_sheet.dart.dart';

class JobDetailPage extends GetView<JobListController> {
  const JobDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
        final Size size = MediaQuery.of(context).size;

    return WillPopScope(
         onWillPop: () async{
        controller.selectedIndex.value = -1;

         controller.onTapJobDetail.value  = false;

         return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(context: context, title: AppTexts.detail,onLeadingPressed: (){
               controller.selectedIndex.value = -1;

         controller.onTapJobDetail.value  = false;
         Get.back();
        },),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                 color: AppColors.blueColor.withOpacity(0.01),
                height: size.height * 0.05,
                 ),
                SizedBox(
                        width: size.width,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppImages.jobListSelectedJob,
                                  height: size.height * 0.13,
                                  width: size.width * 0.25,
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                SizedBox(
                                  height: size.height * 0.13,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "jobTitle",
                                  //      singleJobListItem.jobTitle ?? 'N/A' ,
                                        
                                        style: AppStyles.jobListTextStyle,
                                      ),
                                      Text(
                                        "Company name",
                                        style: AppStyles.jobListTextStyle,
                                      ),
                                      Text(
                                        "Brand",
                                        style: AppStyles.jobListTextStyle,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            AppTexts.jobListQuantity,
                                            style: AppStyles.jobListTextStyle,
                                          ),
                                          Text(
                                            '6',
                                    //       singleJobListItem.jobTitle ?? 'N/A' ,
                                            style: AppStyles.jobListTextStyle,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            AppTexts.jobListRequired,
                                            style: AppStyles.jobListTextStyle,
                                          ),
                                          Text(
                                            "15",
                                            style: AppStyles.jobListTextStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  AppSvg.jobListCompletedSvg,
                                  width: 12.5,
                                  height: 12.5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.03,),
                      Text('Media display positons',style: AppStyles.textStyleCustom),
                        SizedBox(height: size.height * 0.01,),
                        Row(
                            children: [
                                          Text(
                                            'A:',
                                            style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.normal),
                                          ),
                                          Text(
                                            ' 05',
                                            style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.normal),
                                          ),
                                        ]
                                      ),
                           SizedBox(height: size.height * 0.007
                           ,),
                            Row(
                            children: [
                                          Text(
                                            'B:',
                                            style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.normal),
                                          ),
                                          Text(
                                            ' 05',
                                            style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.normal),
                                          ),
                                        ]
                                      ),
                      SizedBox(height: size.height * 0.06,),
                Text(AppTexts.pigeonholeList,style: AppStyles.textStyleCustom.copyWith(fontSize: 22),),
                      const SizedBox(height: 30,),
                     Expanded(child: _pigeonHoleListing())
            ],
          ),
        ),
      ),
    );
  }


Widget _pigeonHoleListing(){

  return ListView.builder(
    shrinkWrap: true,
    itemCount: 13,
    itemBuilder: (BuildContext context, int index){

     return Padding(
       padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
       child: InkWell(
        onTap: (){
            Get.bottomSheet(SelectPigeonHoleBottomSheet(),
             isDismissible: false,
             isScrollControlled: true,
             enableDrag: false);

          // Get.to(SelectedJobScanQRCodePage(
          //   onPressedDoneBtn: (){
          //        Get.bottomSheet(
          //             SelectPigeonHoleBottomSheet(),
          //             isDismissible: false,
          //             isScrollControlled: true,
          //             enableDrag: false
          //           );
          //   },
          // ));
            controller.selectedIndex.value = index;
          controller.onTapJobDetail.value  = true;
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
                   Text('Pigeonhole 01',style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500,fontSize: 19),),
                   const SizedBox(height: 5,),
                    Text('Quantity: 03',style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.w500,fontSize: 17),),
                    
                    
                  ],
                 ),
                           Obx(() {
                       if (controller.selectedIndex.value == index && controller.onTapJobDetail.value) {
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
}