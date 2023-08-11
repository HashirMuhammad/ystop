import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/widgets/cusom_date_picker.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';

import '../../../../core/app/colors.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/texts.dart';

class UpdateJobListStatusStatusBottomSheet extends GetView<JobListController> {
  const UpdateJobListStatusStatusBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      return Container(
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
                      'Posting Date',
                      style: AppStyles.textStyleCustom.copyWith(fontSize: 22),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
  
                      },
                      child: const Icon(Icons.clear))
                  ],
                ),
              ),
            SizedBox(height: constraints.maxHeight * 0.04),
         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomDatePicker(),
            ),
               Expanded(child: Container()),
               _submitButton(),
                SizedBox(height: 50),  
            ],
          ),
      );
    });
  }

    Widget _submitButton() {
    return CustomButtonWidget(
      text: AppTexts.submit,
      onPressed: () {
     
      
      },
      backgroundColor: AppColors.mainThemeColor,
    );
  }
}