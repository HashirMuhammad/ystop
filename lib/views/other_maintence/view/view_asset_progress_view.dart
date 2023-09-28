import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/app/colors.dart';
import '../../../core/app/images.dart';
import '../../../core/app/styles.dart';
import '../../../core/app/texts.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../routes.dart';
import '../controller/other_maintense_controller.dart';

class ViewAssetProgressView extends StatefulWidget {
  const ViewAssetProgressView({super.key});

  @override
  State<ViewAssetProgressView> createState() => _ViewAssetProgressViewState();
}

class _ViewAssetProgressViewState extends State<ViewAssetProgressView> {
  final OtherMaintenseController otherMainTenController =
  Get.put(OtherMaintenseController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Asset:abc',
        onLeadingPressed: () {
          Get.back();
        },
        isAppBarActions: true,
        appBarAction: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            '4/3',
            style: AppStyles.jobListTextStyle,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: <Widget>[
                    const ViewAssetProgressCard(),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: const ViewAssetProgressCard(),
                    ),
                    const ViewAssetProgressCard(),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Text(
                        'Maintenance tasks',
                        style: AppStyles.textStyleCustom
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          3,
                              (int index) =>
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Checkbox(
                                  value: index == 0
                                      ? otherMainTenController.checkBoxOne.value
                                      : index == 1
                                      ? otherMainTenController.checkBoxTwo.value
                                      : otherMainTenController.checkBoxThree
                                      .value,
                                  activeColor: AppColors.mainThemeColor,
                                  onChanged: (bool? value) {
                                    if (index == 0) {
                                      otherMainTenController.checkBoxOne.value =
                                      value!;
                                    } else if (index == 1) {
                                      otherMainTenController.checkBoxTwo.value =
                                      value!;
                                    } else {
                                      otherMainTenController.checkBoxThree
                                          .value = value!;
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
                    })
                  ],
                ),
              ),
            ),

            CustomButtonWidget(onPressed: () {
              Get.toNamed(AppRoutes.createMaintenseView);
            }, text: AppTexts.submit),
            SizedBox(
              height: size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}

class ViewAssetProgressCard extends StatelessWidget {
  final String? title, subtitle, threeTitle, imagePath;

  const ViewAssetProgressCard(
      {super.key, this.title, this.subtitle, this.threeTitle, this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      height: size.height * 0.11,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            width: size.width * 0.18,
            margin: EdgeInsets.only(right: size.width * 0.02),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title ?? 'Position: B',
                style: AppStyles.jobListTextStyle,
              ),
              Text(
                subtitle ?? 'Pigeonhole: abcd',
                style: AppStyles.jobListTextStyle,
              ),
              Text(
                threeTitle ?? 'Rolled: outside',
                style: AppStyles.jobListTextStyle,
              ),
            ],
          ),
          const Spacer(),
          Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(imagePath ?? AppImages.checkIconIcon)),
        ],
      ),
    );
  }
}
