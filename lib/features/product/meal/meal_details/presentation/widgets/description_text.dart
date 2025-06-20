import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/config/theme/colors.dart';

class MealDescriptionText extends StatelessWidget {
  const MealDescriptionText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: neutral300,
      ),
    );
  }
}
