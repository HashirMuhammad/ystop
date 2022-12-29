import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/svg.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/providers/example_autodispose_provider.dart';
import 'package:ystop_mystop/core/providers/example_changenotifier_provider.dart';
import 'package:ystop_mystop/core/providers/example_provider.dart';
import 'package:ystop_mystop/core/utils/app_utils.dart';
import 'package:ystop_mystop/views/auth/login.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
      body: Column(
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
                      "Good Morning, Mr Abc",
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
              Container(
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
              SizedBox(
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
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
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
              SizedBox(
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
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainThemeColor,
        onPressed: () {},
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
