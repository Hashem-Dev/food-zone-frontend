import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/config/theme/colors.dart';
import 'package:food_zone/core/utils/set_space.dart';

class MealOffersPrice extends StatelessWidget {
  const MealOffersPrice({
    super.key,
    required this.price,
    required this.withoutOffer,
  });

  final double price;
  final double withoutOffer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\$ $withoutOffer',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: neutral200,
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
        addHorizontalSpace(8),
        Text(
          '\$ $price',
          style: TextStyle(
            color: primary500,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
