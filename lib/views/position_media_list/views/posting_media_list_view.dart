import 'package:flutter/material.dart';
import 'package:ystop_mystop/views/position_media_list/views/maintenance_task_tab_view.dart';
import 'package:ystop_mystop/views/position_media_list/views/position_task_tab_view.dart';
import '../../../../core/app/colors.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/texts.dart';

class PositionMediaListView extends StatelessWidget{
   PositionMediaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:
      Scaffold(
        backgroundColor: Colors.white,
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
            'Site ID',
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
                text: "Position task",
              ),
              Tab(
                text: "Maintenance task",
              ),
            ],
          ),
        ),

        body: const TabBarView(children: <Widget> [
          PositionTaskTabView(),
          MaintenanceTaskTabView(),
        ]),
      ),
    );
  }
}
