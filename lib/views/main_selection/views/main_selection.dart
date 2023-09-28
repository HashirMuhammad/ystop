import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/svg.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/routes.dart';
import 'package:ystop_mystop/views/home/controller/home_controller.dart';
import 'package:ystop_mystop/views/main_selection/controller/mainselection_controller.dart';

import '../../job_list/views/fragments/job_list_fragment.dart';

class MainSelection extends StatelessWidget {
  const MainSelection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        elevation: 0,
        title: Image.asset(
          AppImages.logoImage,
          height: size.height * 0.1,
          width: size.width * 0.30,
        ),
        actions: [
          SvgPicture.asset(
            AppSvg.homeSearchSvg,
            height: 24,
            width: 24,
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: SvgPicture.asset(
              AppSvg.homeMenuSvg,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
      body:
      // GetBuilder<HomeController>(
      //   init: HomeController(),
      //   builder: (_)=>
            Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.homeAvatar,
                    height: size.height * 0.1,
                    width: size.width * 0.15,
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Good Morning, ${controller.loginModel != null ? '${controller.loginModel!.result?.firstName} ${controller.loginModel!.result?.lastName}' : ''}',
                      //   style: AppStyles.homeGreet,
                      // ),
                      Text(
                        'Good Morning, Mr Abc',
                        style: AppStyles.homeGreet,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        AppTexts.homeWelcome,
                        style: AppStyles.homeWelcome,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.postingMedia);

                  },
                  child: Card(
                    child: Container(
                      width: size.width * 0.43,
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                        color: AppColors.primaryJobListContainerColor,
                        border: Border.all(
                          color: AppColors.mainThemeColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.postingMedia),
                          SizedBox(
                            height: size.height *  0.01,
                          ),
                          Text(
                            AppTexts.postingMedia,
                            style: AppStyles.homeCategory,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    // Get.toNamed(AppRoutes.receivedMediaScanQr);
                  },
                  child: Card(
                    child: Container(
                      width: size.width * 0.43,
                      height: size.height * 0.25,
                      color: AppColors.primaryJobListContainerColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.dashboard),
                          SizedBox(
                            height: size.height *  0.01
                          ),
                          Text(
                            AppTexts.dashboard,
                            style: AppStyles.homeCategory,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    // Get.toNamed(AppRoutes.moveMediaScanQrPage);

                  },
                  child: Card(
                    child: Container(
                      width: size.width * 0.43,
                      height: size.height * 0.25,
                      color: AppColors.primaryJobListContainerColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.Maintenence),
                          SizedBox(
                            height: size.height *  0.01,
                          ),
                          Text(
                            AppTexts.maintainance,
                            style: AppStyles.homeCategory,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    // Get.toNamed(AppRoutes.destroyMediaScanQrPage);

                  },
                  child: Card(
                    child: Container(
                      width: size.width * 0.43,
                      height: size.height * 0.25,
                      color: AppColors.primaryJobListContainerColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 25),
                          Image.asset(AppImages.GeneralTask),
                          SizedBox(
                            height: size.height * 0.01
                          ),
                          Text(
                            AppTexts.generalTask,
                            style: AppStyles.homeCategory,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainThemeColor,
        onPressed: () {
          // Get.to(HomeView2());

        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
