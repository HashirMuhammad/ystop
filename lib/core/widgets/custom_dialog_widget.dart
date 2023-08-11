import 'package:flutter/material.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';

import '../app/colors.dart';
import '../app/images.dart';

class CustomDialogWidget extends StatelessWidget {
  final String title;
  final dynamic Function()? onPressed;
  const CustomDialogWidget({required this.title, required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: size.height*0.4,
        width: size.width*0.9,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                 //   mainAxisSize: MainAxisSize.min,
            children: [
             Image.asset(AppImages.successIcon),
              const SizedBox(height: 8),
              Text(
                'Successful',style: AppStyles.textStyleCustom.copyWith(color: AppColors.primaryGreenColor,fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              
               Text(
                title,style: AppStyles.exampleTextstyle.copyWith(color: AppColors.primaryBlackColor,fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40,),
            CustomButtonWidget(text: 'Done', onPressed: onPressed)
            ],
          ),
        ),
      ),
    );
  }
}
