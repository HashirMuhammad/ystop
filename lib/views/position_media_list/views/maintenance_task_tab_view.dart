import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';

import '../../../../core/app/colors.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/svg.dart';
import '../../../../core/app/texts.dart';
import '../../../../core/widgets/loading_widget.dart';

class MaintenanceTaskTabView extends StatelessWidget{
  const MaintenanceTaskTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(children: [
      _buildCompletedBuilder(size)
    ],);
  }



  _buildCompletedBuilder(Size size) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
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
                            'N/A',
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
                            'N/A',
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
