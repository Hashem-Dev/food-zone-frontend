import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/core/global_widgets/shimmers/random_restaurant.dart';

class RandomRestaurantListShimmer extends StatelessWidget {
  const RandomRestaurantListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, index) {
        return Container(
          margin: EdgeInsetsDirectional.fromSTEB(0, 0, 12.w, 12.h),
          child: const RandomRestaurantShimmer(),
        );
      },
    );
  }
}
