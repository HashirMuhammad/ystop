import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/widgets/loading_widget.dart';
import 'package:ystop_mystop/views/job_list/controller/job_list_controller.dart';
import '../../../../core/app/colors.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/svg.dart';
import '../../../../core/app/texts.dart';

class PositionTaskTabView extends StatelessWidget {
  const PositionTaskTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return
        // Obx(() {
        // return controller.isLoading.value ==
        //     JobListLoadingType.parent ? const LoadingWidget() :
        Column(
      children: [_buildCurrentBuilder(size)],
    );
    // });
  }

  _buildCurrentBuilder(Size size) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              width: size.width,
              color: AppColors.primaryJobListContainerColor,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.rectangle,height: 70,width: 70,),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Position: A'),
                      Text('Pigeonhole: abcd'),
                      Text('Rolled: inside'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
