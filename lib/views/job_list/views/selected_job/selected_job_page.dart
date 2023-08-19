import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/widgets/loading_widget.dart';
import 'package:ystop_mystop/views/job_list/views/selected_job/update_job_list_status_bottom_sheet.dart';

import '../../../../core/app/colors.dart';
import '../../../../core/app/images.dart';
import '../../../../core/app/svg.dart';
import '../../../../core/app/texts.dart';
import '../../controller/job_list_controller.dart';

class SelectedJobPage extends GetView<JobListController> {
  const SelectedJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: AppColors.primaryBlackColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Selected Job title",
          style: AppStyles.jobListHeadingStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: SvgPicture.asset(
              AppSvg.jobListSelectedSvg,
              width: 14,
              height: 16,
            ),
          ),
        ],
      ),
      body: Obx(() {
         return controller.isLoading.value == JobListLoadingType.parent ? LoadingWidget() : Column(
        children: [
          _buildSearchField(context),
         // if(controller.getSingleJobListModel.data !=null && controller.getSingleJobListModel.data!.isNotEmpty)
          _buildBuilder(size),
        ],
      );
      })
      
    
    );
  }

  _buildBuilder(Size size) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {

       //  final singleJobListItem = controller.getSingleJobListModel.data![index];

          return Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.08,
              right: size.width * 0.08,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                InkWell(
                  onTap: (){
                    Get.bottomSheet(
                      UpdateJobListStatusStatusBottomSheet(),
                      isDismissible: false,
                      isScrollControlled: true,
                      enableDrag: false
                    );
                  },
                  child: SizedBox(
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildSearchField(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.07,
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.07,
          ),
          child: TextFormField(
            controller: controller.selectedJobTitleSearchEditingController,
            decoration: InputDecoration(
              label: const Text(AppTexts.jobListSearchTitle),
              labelStyle: AppStyles.jobListTextStyleGrey,
              floatingLabelStyle: AppStyles.jobListTextStyleGrey,
              border: InputBorder.none,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  AppSvg.homeSearchSvg,
                  height: 20,
                  width: 20,
                ),
              ),
              isDense: true,
            ),
            cursorColor: AppColors.mainThemeColor,
          ),
        );
  }
}
