
import 'package:flutter/material.dart';
import 'package:ystop_mystop/core/app/images.dart';

import '../app/colors.dart';
import '../app/styles.dart';

// class CustomButtonWidget extends StatelessWidget{
//   final String title;
//   const CustomButtonWidget({required this.title, super.key});

//   @override
//   Widget build(BuildContext context) {
   
//    return Container(
//             height: MediaQuery.of(context).size.height * 0.075,
//        //     width: MediaQuery.of(context).size.width * 0.5,
//             decoration: BoxDecoration(
//               color: AppColors.mainThemeColor,
//               borderRadius: BorderRadius.circular(47),
//             ),
//             child: Center(
//               child: Text(
//                 title,
//                 style: AppStyles.loginButtonTextStyle,
//               ),
//             ),
//           );

//   }

// }

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isScanQrBtn;

  const CustomButtonWidget({required this.text, required this.onPressed, this.isScanQrBtn = false,super.key,
    this.backgroundColor ,
    this.textColor ,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        elevation: 0,
         backgroundColor:backgroundColor ??  AppColors.mainThemeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: !isScanQrBtn ? Padding(
        padding: const EdgeInsets.symmetric(horizontal:55,vertical: 22),
        child: Text(
          text,
          style: AppStyles.textStyleCustom.copyWith(color: textColor ?? AppColors.primaryWhite)
        ),
      ) : Padding(
       padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 18),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(
              
              AppImages.scanImage,
              fit: BoxFit.fill,
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 12,),
            Text(
              text,
              style: AppStyles.textStyleCustom.copyWith(color: textColor ?? AppColors.primaryWhite)
            ),
          ],
        ),
      ),
    );
  }
}
