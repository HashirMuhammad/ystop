import 'package:flutter/material.dart';

import '../app/colors.dart';
import '../app/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Color? cursorColor;

  const CustomTextField({
    required this.controller, required this.hintText, Key? key,
    this.prefixIcon,
    this.cursorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 16), // Padding around hint text

        hintText: hintText,
        hintStyle: AppStyles.loginTextFieldHintStyle,
                filled: true,
                

        fillColor: AppColors.blueColor.withOpacity(0.02),
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(14), // Rounded border
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(14.0),
                child: prefixIcon,
              )
            : null,
        isDense: true,
       focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.blueColor, // Set the focused border color to blue
          ),
        ),
        focusColor: AppColors.blueColor
      ),
      
      cursorColor: cursorColor ?? AppColors.mainThemeColor,
    );
  }
}
