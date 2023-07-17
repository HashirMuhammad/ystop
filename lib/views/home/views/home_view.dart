import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/svg.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/routes.dart';
import 'package:ystop_mystop/views/fragments/job_list_fragment.dart';
import 'package:ystop_mystop/views/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_)=> Column(
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
                      Text(
            'Good Morning, ${controller.loginModel != null ? '${controller.loginModel!.result?.firstName} ${controller.loginModel!.result?.lastName}' : ''}',
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
                    Navigator.of(context).push<void>(
                      CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              const JobListFragment()),
                    );
                  },
                  child: Container(
                    width: size.width * 0.43,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.mainThemeColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.homeJobList),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          AppTexts.homeJobList,
                          style: AppStyles.homeCategory,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(AppRoutes.receivedMediaScanQr);
                  },
                  child: SizedBox(
                    width: size.width * 0.43,
                    height: size.height * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.homeReceivedMedia),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          AppTexts.homeReceivedMedia,
                          style: AppStyles.homeCategory,
                        )
                      ],
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
                  Get.toNamed(AppRoutes.moveMediaScanQrPage);
                    
                  },
                  child: SizedBox(
                    width: size.width * 0.43,
                    height: size.height * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.homeMoveMedia),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          AppTexts.homeMoveMedia,
                          style: AppStyles.homeCategory,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                     Get.toNamed(AppRoutes.destroyMediaScanQrPage);
                    
                  },
                  child: SizedBox(
                    width: size.width * 0.43,
                    height: size.height * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.homeDestroy),
                        Text(
                          AppTexts.homeDestroy,
                          style: AppStyles.homeCategory,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainThemeColor,
        onPressed: () {},
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}