import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/routes.dart';

import '../../../core/app/colors.dart';
import '../../../core/app/styles.dart';
import '../../../core/app/svg.dart';
import '../../../core/app/texts.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';
import '../controller/other_maintense_controller.dart';

class OtherMaintenanceView extends StatefulWidget {
  const OtherMaintenanceView({Key? key}) : super(key: key);

  @override
  State<OtherMaintenanceView> createState() => _OtherMaintenanceViewState();
}

class _OtherMaintenanceViewState extends State<OtherMaintenanceView> {
  final OtherMaintenseController otherMainTenController =
      Get.put(OtherMaintenseController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: AppTexts.listMaintenance,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //search field
            _buildSearchFieldCurrent(context, MediaQuery.of(context).size),
            Expanded(
              child: Obx(() {
                return ListView(
                  children: List.generate(
                    3,
                    (int index) => ListTile(
                      leading: Checkbox(
                        value: index == 0
                            ? otherMainTenController.checkBoxOne.value
                            : index == 1
                                ? otherMainTenController.checkBoxTwo.value
                                : otherMainTenController.checkBoxThree.value,
                        activeColor: AppColors.mainThemeColor,
                        onChanged: (bool? value) {
                          if (index == 0) {
                            otherMainTenController.checkBoxOne.value = value!;
                          } else if (index == 1) {
                            otherMainTenController.checkBoxTwo.value = value!;
                          } else {
                            otherMainTenController.checkBoxThree.value = value!;
                          }
                        },
                      ),
                      title: Text(
                        'Item ...${index + 1}',
                        style: AppStyles.jobListTextStyle,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            CustomButtonWidget(onPressed: () {
              Get.toNamed(AppRoutes.viewAssetProgressView);
            }, text: AppTexts.done),
            SizedBox(
              height: size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }

  _buildSearchFieldCurrent(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.08,
        top: size.height * 0.02,
        right: size.width * 0.08,
      ),
      child: TextFormField(
        controller: otherMainTenController.searchController,
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
}
