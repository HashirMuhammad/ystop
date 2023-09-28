import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/routes.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';

import '../../../../core/app/styles.dart';

class MediaAfterAccept extends GetView<JobListController> {
  MediaAfterAccept({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context: context, title: AppTexts.jobListId),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Expanded(
                    child:
                        _joblistIDlising(size: Size(constraints.maxWidth, constraints.maxHeight)))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _joblistIDlising({required Size size}) {
    Widget verticalSpace = SizedBox(
      height: 13,
    );

    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: InkWell(
              onTap: () {
                // Get.toNamed(AppRoutes.employCounterPage);
              },
              child: Card(
                child: Container(
                  color: AppColors.primaryJobListContainerColor,
                  // AppColors.blueColor.withOpacity(0.01),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        horizontalRow(title: "Site id", descripion: "Y-123-454"),
                        verticalSpace,
                        horizontalRow(title: "Address", descripion: "Y-123-454"),
                        verticalSpace,
                        horizontalRow(title: "Maintenance Tasks", descripion: "12"),
                        verticalSpace,
                        horizontalRow(title: "Posting Tasks", descripion: "21"),
                        verticalSpace,
                        Text(
                          "Status:",
                          style:
                              AppStyles.textStyleCustom.copyWith(color: AppColors.mainThemeColor),
                        ),
                        verticalSpace,
                        horizontalRow(title: "Posting", descripion: "2"),
                        verticalSpace,
                        horizontalRow(title: "Leave", descripion: "3"),
                        verticalSpace,
                        horizontalRow(title: "Move", descripion: "3"),
                        verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(onTap: (){
                              Get.toNamed(AppRoutes.genericScanView);
                            },
                              child: Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                    color: AppColors.mainThemeColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image(image: AssetImage(AppImages.scanImage)),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget horizontalRow({required String title, required String descripion}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.jobListTextStyle,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  descripion,
                  style: AppStyles.jobListTextStyle,
                ))),
      ],
    );
  }
}
