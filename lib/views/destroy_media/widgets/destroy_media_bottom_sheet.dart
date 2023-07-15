import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';
import 'package:ystop_mystop/views/destroy_media/controller/destroy_media_controller.dart';

import '../../../core/widgets/custom_text_field.dart';
import 'destroy_media_confirmation_bottom_sheet.dart';

class DestroyMediaBottomSheet extends GetView<DestroyMediaController> {
  const DestroyMediaBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25)
          ),
        ),
        height: constraints.maxHeight * 0.55,
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
                          AppTexts.pigeonHoleID,
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
                    ),
                    SizedBox(height: 20), // Added space after text field
                    Expanded(child: Container()), // Space filler
                    _destroyMediaButton(),
                     SizedBox(height: 25),  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _destroyMediaButton() {
    return CustomButtonWidget(
      text: AppTexts.destroy,
      onPressed: () {
            Get.back();
        Get.bottomSheet(
          DestroyMediaConfirmationBottomSheet()
        );
      },
      backgroundColor: AppColors.redColor,
    );
  }
}
