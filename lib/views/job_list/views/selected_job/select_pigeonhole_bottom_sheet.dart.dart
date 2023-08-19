import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/widgets/custom_text_field.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';
import 'package:ystop_mystop/views/job_list/views/selected_job/selected_medoa_bottom_sheet.dart';
import '../../../../core/app/colors.dart';
import '../../../../core/app/images.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/texts.dart';
import '../../../../core/widgets/custom_button.dart';

class SelectPigeonHoleBottomSheet extends GetView<JobListController> {
  const SelectPigeonHoleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: constraints.maxHeight * 0.6,
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
                      'Pigeonhole 01',
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
            SizedBox(height: constraints.maxHeight * 0.04),
            Expanded(child: _mediaList(size: Size(constraints.maxWidth, constraints.maxHeight)))
              ],
            ),
      );
      },
        );
  }

  Widget _mediaList({required Size size}){
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
                              width: size.width,
                              child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width * 0.08),
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
                                                "Company name",
                                                style: AppStyles.jobListTextStyle,
                                              ),
                                              Text(
                                                "Brand Name",
                                                style: AppStyles.jobListTextStyle,
                                              ),
          
                                              SizedBox(
                                                width: size.width * 0.5,
                                                child: CustomTextField(controller: TextEditingController(), hintText: 'Enter Quantity',readOnly: true,))
                                         
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                               Text(
                                                    "(8)",
                                                    style: AppStyles.jobListTextStyle,
                                                  ),
                                    
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
          );
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _submitButton(),
        )
      ],
    );
  }

    Widget _submitButton() {
    return CustomButtonWidget(
      text: AppTexts.next,
      onPressed: () {
      Get.bottomSheet(
                      SelectedMediaBottomSheet(),
                      isDismissible: false,
                      isScrollControlled: true,
                      enableDrag: false
                    );
      
      },
      backgroundColor: AppColors.mainThemeColor,
    );
  }
}