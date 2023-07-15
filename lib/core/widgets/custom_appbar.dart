import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/styles.dart';

import '../app/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? appBarColor;
  final Color? leadingIconColor;
  final Color? titleColor;
  final bool isAppBarActions;
  final Widget? appBarAction;
  final String title;
  VoidCallback? onLeadingPressed;

  CustomAppBar({
    required BuildContext context,
    required this.title,
    this.appBarColor,
    this.isAppBarActions = false,
    this.appBarAction,
    this.titleColor,
    this.leadingIconColor,
    this.onLeadingPressed,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize {
    // Add desired spacing above the AppBar
    return isAppBarActions ? Size.fromHeight(kToolbarHeight + 24) :Size.fromHeight(kToolbarHeight );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:isAppBarActions ?  EdgeInsets.only(top: 24) : EdgeInsets.only(top: 0), // Set the desired spacing value
      color: appBarColor ?? AppColors.primaryWhite, // Customize the background color
      child: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar background transparent
        leading: InkWell(
          onTap: onLeadingPressed ?? () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: leadingIconColor ?? AppColors.primaryBlackColor, // Customize the leading icon color
          ),
        ),
        actions: isAppBarActions ? [appBarAction!] : null,
        elevation: 0,
        title: Text(
          title,
          style: AppStyles.textStyleCustom.copyWith(color: titleColor ?? AppColors.primaryBlackColor),
        ),
        centerTitle: true,
      ),
    );
  }
}
