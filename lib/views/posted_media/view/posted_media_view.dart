import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/images.dart';

import '../../../core/app/styles.dart';
import '../../../core/app/texts.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../routes.dart';
import '../controller/postedmedia_controller.dart';

class PostedMediaView extends StatefulWidget {
  const PostedMediaView({Key? key}) : super(key: key);

  @override
  State<PostedMediaView> createState() => _PostedMediaViewState();
}

class _PostedMediaViewState extends State<PostedMediaView> {
  final PostedMediaController postedMediaController =
      Get.put(PostedMediaController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              context: context,
              title: 'Media',
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Asset:abc',
                      style: AppStyles.textStyleCustom
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Position',
                          style: AppStyles.textStyleCustom.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 14),
                        ),
                        Text(
                          'A',
                          style: AppStyles.textStyleCustom.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Pigeonhole:',
                        style: AppStyles.textStyleCustom.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                      Text(
                        'abcde',
                        style: AppStyles.textStyleCustom.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Rolled:',
                        style: AppStyles.textStyleCustom.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                      Text(
                        'inside',
                        style: AppStyles.textStyleCustom.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text(
                    'Posted media image',
                    style: AppStyles.textStyleCustom
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  //pick image button
                  CameraBtn(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.zero,
                          actions: [
                            Container(
                              width: size.width * 0.9,
                              padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.02),
                                    child: Text(
                                      'Item 01....',
                                      style: AppStyles.textStyleCustom.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: AppColors.primaryBlackColor),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: size.height * 0.05),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.01),
                                          child: SvgPicture.asset(
                                            AppImages.cameraIcon,
                                            width: size.height * 0.15,
                                            height: size.width * 0.15,
                                          ),
                                        ),
                                        Text(
                                          'Add image',
                                          style: AppStyles.textStyleCustom
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.primaryGreyColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                          width: size.width * 0.3,
                                          height: size.height * 0.05,
                                          child:
                                          ElevatedButton(
                                            onPressed: (){
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor:  AppColors.greyBtnColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                            ),
                                            child:  Text(
                                                'No',
                                                style: AppStyles.textStyleCustom.copyWith(color:  AppColors.primaryBlackColor)
                                            ),
                                          )
                                      ),
                                      SizedBox(
                                        width: size.width * 0.3,
                                        height: size.height * 0.05,
                                        child:
                                       ElevatedButton(
                                         onPressed: (){
                                           Get.back();
                                         },
                                         style: ElevatedButton.styleFrom(
                                           elevation: 0,
                                           backgroundColor:  AppColors.mainThemeColor,
                                           shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(30),
                                           ),
                                         ),
                                         child:  Text(
                                             'Yes',
                                             style: AppStyles.textStyleCustom.copyWith(color:  AppColors.primaryWhite)
                                         ),
                                       )
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Text(
                      'For maintenance',
                      style: AppStyles.textStyleCustom
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const ChipWidget(),
                      ChipWidget(
                        title: 'Item 02..',
                        backgroundColor:
                            AppColors.primaryGreyColor.withOpacity(0.2),
                      ),
                      const ChipWidget(
                        title: 'Item 03...',
                      ),
                      const ChipWidget(
                        title: 'Others',
                        backgroundColor: AppColors.primaryBlackColor,
                        textColor: AppColors.primaryWhite,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonWidget(onPressed: () {
                        Get.toNamed(AppRoutes.otherMaintenancePage);
                      }, text: AppTexts.yes),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final String? title;
  final Color? backgroundColor, textColor;

  const ChipWidget(
      {super.key, this.title, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        title ?? 'One',
        style: AppStyles.textStyleCustom.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: textColor ?? AppColors.primaryBlackColor),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      backgroundColor:
          backgroundColor ?? AppColors.mainThemeColor.withOpacity(0.2),
    );
  }
}

class CameraBtn extends StatelessWidget {
  final VoidCallback? onPressed;

  const CameraBtn({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade300,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: SvgPicture.asset(AppImages.cameraIcon),
            ),
            Text(
              'Add image',
              style: AppStyles.textStyleCustom.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.primaryGreyColor),
            )
          ],
        ),
      ),
    );
  }
}
