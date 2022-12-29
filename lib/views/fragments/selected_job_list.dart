// ignore_for_file: prefer_const_constructors, prefer_single_quotes
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ystop_mystop/core/app/images.dart';

import '../../core/app/colors.dart';
import '../../core/app/styles.dart';
import '../../core/app/svg.dart';
import '../../core/app/texts.dart';
import '../../core/providers/job_list_provider.dart';

class SelectedJobList extends ConsumerStatefulWidget {
  const SelectedJobList({super.key});

  @override
  ConsumerState<SelectedJobList> createState() => _SelectedJobListState();
}

class _SelectedJobListState extends ConsumerState<SelectedJobList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: AppColors.primaryBlackColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Selected Job title",
          style: AppStyles.jobListHeadingStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: SvgPicture.asset(
              AppSvg.jobListSelectedSvg,
              width: 14,
              height: 16,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchField(context),
          _buildBuilder(size),
        ],
      ),
    );
  }

  _buildBuilder(Size size) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.jobListSelectedJob,
                            height: size.height * 0.13,
                            width: size.width * 0.25,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          SizedBox(
                            height: size.height * 0.13,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Title here",
                                  style: AppStyles.jobListTextStyle,
                                ),
                                Text(
                                  "Company name",
                                  style: AppStyles.jobListTextStyle,
                                ),
                                Text(
                                  "Brand",
                                  style: AppStyles.jobListTextStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      AppTexts.jobListQuantity,
                                      style: AppStyles.jobListTextStyle,
                                    ),
                                    Text(
                                      "20",
                                      style: AppStyles.jobListTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      AppTexts.jobListRequired,
                                      style: AppStyles.jobListTextStyle,
                                    ),
                                    Text(
                                      "15",
                                      style: AppStyles.jobListTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            AppSvg.jobListCompletedSvg,
                            width: 12.5,
                            height: 12.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildSearchField(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.07,
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.07,
          ),
          child: TextFormField(
            controller: ref.watch(jobListProvider).selectedSearchController,
            decoration: InputDecoration(
              label: const Text(AppTexts.jobListSearchTitle),
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
      },
    );
  }
}
