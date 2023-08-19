import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:ystop_mystop/views/job_list/views/fragments/completed_tab_fragment.dart';
import 'package:ystop_mystop/views/job_list/views/fragments/current_tab_fragment.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';

import '../../../../core/app/colors.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/texts.dart';

class JobListFragment extends GetView<JobListController> {
  const JobListFragment({super.key});

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
      length: 2,
       child: GetBuilder<JobListController>(
        init: JobListController(),
        builder: (_){
          return Scaffold(
              appBar:AppBar(
          backgroundColor: AppColors.primaryWhite,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: AppColors.primaryBlackColor,
            ),
          ),
          elevation: 0,
          title: Text(
            AppTexts.jobList,
            style: AppStyles.jobListHeadingStyle,
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColors.mainThemeColor,
            labelStyle: AppStyles.jobListTextStyle,
            labelColor: AppColors.primaryBlackColor,
            indicatorWeight: 3.0,
            tabs: const <Widget> [
              Tab(
                text: "Current(3)",
              ),
              Tab(
                text: "Completed(5)",
              ),
            ],
          ),
        ),
              
              //  CustomAppBar(context: context,
              //   title: AppTexts.jobList,
                
              //   isBottomWidget: true, bottomWidget:TabBar(
              //   indicatorColor: AppColors.mainThemeColor,
              //   labelStyle: AppStyles.jobListTextStyle,
              //   labelColor: AppColors.primaryBlackColor,
              //   indicatorWeight: 3.0,
              //   tabs: const <Widget>[
              //     Tab(
              //       text: "Current(3)",
              //     ),
              //     Tab(
              //       text: "Completed(5)",
              //     ),
              //   ],
              // ) ,
              // ),
              body: const TabBarView(children: <Widget> [
               CurrentTabFragment(),
               CompletedTabFragment()
              ]),
           );
        },
      
       ),
     );
  }
}