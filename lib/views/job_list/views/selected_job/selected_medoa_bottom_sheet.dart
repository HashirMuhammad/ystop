import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';

import '../../../../core/app/colors.dart';
import '../../../../core/app/images.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/texts.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/radio_button_widget.dart';

// ignore: must_be_immutable
class SelectedMediaBottomSheet extends GetView<JobListController> {
   SelectedMediaBottomSheet({super.key});
 
 Size? size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context,constraints){
        return Container(
          decoration: const BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                ),
              ),
              height: constraints.maxHeight * 0.5,
              child: Column(
              children: [
                   SizedBox(height: 20),
                   Column(
                    children: [
        Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      'Selected Media',
                      style: AppStyles.textStyleCustom.copyWith(fontSize: 22),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                       // Get.back();
  
                      },
                      child: const Icon(Icons.clear))
                  ],
                ),
              ),
               SizedBox(height: 20,),
                Text(
                      '(1/6)',
                      style: AppStyles.textStyleCustom,
                    ),
                    ],
                   ),
               
             
            SizedBox(height: constraints.maxHeight * 0.04),
               Expanded(
                 child: SingleChildScrollView(
                   child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: size!.width * 0.08),
                     child: Column(
                       children: [
                         Column(
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.asset(
                                   AppImages.jobListSelectedJob,
                                   height: size!.height * 0.13,
                                   width: size!.width * 0.25,
                                 ),
                                 SizedBox(
                                   width: size!.width * 0.02,
                                 ),
                                 SizedBox(
                                   height: size!.height * 0.13,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                 Row(
                                   children: [
                                  Text(
                                         "Pigeonhole:",
                                         style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.bold),
                                       ),
                                        Text(
                                         "  Pigeonhole ID",
                                         style: AppStyles.jobListTextStyle,
                                       ),
                                   ],
                                 ),
                                      
                                       Text(
                                         "Rolled:",
                                         style: AppStyles.textStyleCustom.copyWith(fontWeight: FontWeight.bold),
                                       ),
                               _radioBtnWidget(),
                               
                                     ],
                                   ),
                                 ),
                                 Spacer(),
                                       
                             
                               ],
                             ),
                           ],
                         ),
                         SizedBox(height: 20,),
                         _scanMediaAndPigeonhole(),
                      
                        
                   
                       ],
                     ),
                   ),
                 ),
               ),
               Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _submitButton(),
        ),
               SizedBox(height: 15,)
              ],
            ),
      );
      }

    );
  }

  Widget _radioBtnWidget(){
    return Obx(() =>  Row(
        children: [
          RadioButtonWidget(
      title: 'Inside',
      value: 0,
      fontSize: 14,
      groupValue: controller.radioBtnValue.value,
      onChanged: (value) {
          controller.radioBtnValue.value = value;
      },
      ),
          RadioButtonWidget(
      title: 'Outside',
      value: 1,
      fontSize: 14,
      groupValue: controller.radioBtnValue.value,
      onChanged: (value) {
             controller.radioBtnValue.value = value;
      },
      ),
    
        ],
      ),
    );
  }

  Widget _scanMediaAndPigeonhole(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Scan Media',style: AppStyles.textStyleCustom,),
            SizedBox(height: 10,),
           SizedBox(
              width: 40,
              height: 40,
              child: FittedBox(
                child: FloatingActionButton(
                
                  onPressed: () {},
                  backgroundColor: AppColors.mainThemeColor,
                  
                  child: Image.asset(AppImages.scanImage),
                  
                ),
              ),
            )
          ],
         ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Scan Pigeonhole',style: AppStyles.textStyleCustom,),
            SizedBox(height: 10,),
           SizedBox(
              width: 40,
              height: 40,
              child: FittedBox(
                child: FloatingActionButton(
                
                  onPressed: () {},
                  backgroundColor: AppColors.mainThemeColor,
                  
                  child: Image.asset(AppImages.scanImage),
                  
                ),
              ),
            )
          ],
         )
        ],
      ),
    );
  }
      Widget _submitButton() {
    return CustomButtonWidget(
      text: AppTexts.done,
      onPressed: () {

      
      },
      backgroundColor: AppColors.mainThemeColor,
    );
  }
}