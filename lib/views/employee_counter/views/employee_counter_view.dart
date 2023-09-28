import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/routes.dart';

import '../../../core/app/colors.dart';
import '../../../core/app/styles.dart';
import '../../../core/app/svg.dart';

class EmployCounterPage extends StatelessWidget {
  EmployCounterPage({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Posting media',
        context: context,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 20),
            child: Row(
              children: [
                Text(
                  'Select persons linked to your job',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          _buildSearchField(context),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20,right: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Selected Persons',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Mr.Abc'),
                 Icon(Icons.close,size: 18,),
                ],), SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Mr.Abc'),
                 Icon(Icons.close,size: 18,),
                ],), SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Mr.Abc'),
                 Icon(Icons.close,size: 18,),
                ],), SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Mr.Abc'),
                 Icon(Icons.close,size: 18,),
                ],),

              ],
            ),
          ),
          Expanded(child: SizedBox()),
          _buildContinueButton(context),
          SizedBox(height: 20),
        ],
      ),

    );
  }

  _buildSearchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.07,
        top: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.width * 0.07,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffF4F4F4),
          label: const Text('Select Persons'),
          labelStyle: AppStyles.jobListTextStyleGrey,
          floatingLabelStyle: AppStyles.jobListTextStyleGrey,
          border: InputBorder.none,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
          isDense: true,
        ),
        cursorColor: AppColors.mainThemeColor,
      ),
    );
  }
  _buildContinueButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.065),
      child: InkWell(
        onTap: () async {
Get.toNamed(AppRoutes.mediaAfterAccept);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: AppColors.mainThemeColor,
            borderRadius: BorderRadius.circular(47),
          ),
          child: Center(
            child: Text(
              AppTexts.forgotPasswordContinue,
              style: AppStyles.forgotPasswordButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}
