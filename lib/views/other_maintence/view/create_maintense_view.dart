import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/app/colors.dart';
import '../../../core/app/images.dart';
import '../../../core/app/styles.dart';
import '../../../core/app/texts.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../posted_media/view/posted_media_view.dart';

class CreateMaintenceView extends StatefulWidget {
  const CreateMaintenceView({super.key});

  @override
  State<CreateMaintenceView> createState() => _CreateMaintenceViewState();
}

class _CreateMaintenceViewState extends State<CreateMaintenceView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Create maintenance',
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: size.height * 0.02),
                      child: Text(
                        'Upload posted media images',
                        style: AppStyles.jobListTextStyle,
                      ),
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.2,
                          height: size.width * 0.18,
                          margin: EdgeInsets.symmetric(vertical:  size.width * 0.04),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AppImages.cameraIcon,
                            width: size.height * 0.05,
                            height: size.width * 0.05,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: size.width * 0.02  ),
                      child: Text(
                        'Description',
                        style: AppStyles.textStyleCustom
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 16,color: AppColors.primaryBlackColor),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Write description here',
                          hintStyle: AppStyles.textStyleCustom.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.primaryGreyColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.greyColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.greyColor,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.greyColor,
                              width: 1,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),

                        ),
                        onTapOutside: (val){
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Text(
                        'Sub tasks',
                        style: AppStyles.textStyleCustom
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    //chip
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChipWidget(
                          title: 'Item 01..',
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          textColor: AppColors.primaryBlackColor,
                        ),
                        ChipWidget(
                          title: 'Item 02...',
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          textColor: AppColors.primaryBlackColor,
                        ),
                        ChipWidget(
                          title: 'Item 03...',
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          textColor: AppColors.primaryBlackColor,
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

                        }, text: AppTexts.submit),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
