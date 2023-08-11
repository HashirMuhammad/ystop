import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';

import '../../core/app/colors.dart';
import '../../core/app/styles.dart';
import '../../core/app/svg.dart';
import '../../core/app/texts.dart';
import '../../core/widgets/loading_widget.dart';

class CompletedTabFragment extends GetView<JobListController> {
  const CompletedTabFragment({super.key});

  @override
  Widget build(BuildContext context) {
          final Size size = MediaQuery.of(context).size;
   return  Obx(() {
    return controller.isLoading.value == JobListLoadingType.parent ? const LoadingWidget() : Column(
      children: [
        _buildSearchFieldCurrent(context,size),
        _buildCompletedBuilder(size)
      ],
    );
    });
  }


      _buildSearchFieldCurrent(BuildContext context, Size size) {
    return Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.08,
            top: size.height * 0.02,
            right: size.width * 0.08,
          ),
          child: TextFormField(
            controller: controller.completedJobListSearchEditingController,
            decoration: InputDecoration(
              label: const Text(AppTexts.jobListSearch),
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

   _buildCompletedBuilder(Size size) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.getJobListByStatusModel.data!.length,
        itemBuilder: (BuildContext context, int index) {

               final jobListItem = controller.getJobListByStatusModel.data![index];


          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                        jobListItem.jobTitle ?? 'N/A',
                            style: AppStyles.jobListTextStyle,
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            AppSvg.jobListCompletedSvg,
                            width: 12.5,
                            height: 12.5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            AppTexts.jobListCouncilName,
                            style: AppStyles.jobListTextStyle,
                          ),
                          Text(
                           jobListItem.council ?? 'N/A',
                            style: AppStyles.jobListTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            AppTexts.jobListCampaignDate,
                            style: AppStyles.jobListTextStyle,
                          ),
                          Text(
                           '${jobListItem.campaignStartDate} to ${jobListItem.campaignEndDate}',
                            style: AppStyles.jobListTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            AppTexts.jobListJobStatus,
                            style: AppStyles.jobListTextStyle,
                          ),
                          Text(
                            "23 / 80",
                            style: AppStyles.jobListTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}