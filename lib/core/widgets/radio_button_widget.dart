import 'package:flutter/material.dart';
import 'package:ystop_mystop/core/app/styles.dart';

import '../app/colors.dart';


class RadioButtonWidget extends StatelessWidget {
  final String title;
  final dynamic value;
  final Function(dynamic)? onChanged;
  final dynamic groupValue;
  final double ? fontSize;
  const RadioButtonWidget({Key? key,required this.title,required this.value,this.onChanged, this.groupValue, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Radio<dynamic>(
            activeColor: AppColors.mainThemeColor,
            groupValue: groupValue,
            value: value,
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity
            ),
            onChanged: onChanged),
        RichText(
          text: TextSpan(
            text: title,
            style: AppStyles.textStyleCustom.copyWith(
                fontSize: fontSize),
          ),
        ),
      ],
    );
  }

}