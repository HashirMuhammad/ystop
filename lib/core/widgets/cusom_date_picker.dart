import 'package:flutter/material.dart';
import 'package:ystop_mystop/core/app/colors.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime selectedDate = DateTime.now();

  CustomDatePicker({super.key});

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      // Handle selected date if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDatePicker(context),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.blueColor.withOpacity(0.02),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: AppColors.greyColor.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}
