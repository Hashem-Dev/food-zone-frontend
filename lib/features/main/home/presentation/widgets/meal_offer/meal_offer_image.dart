import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/core/utils/extensions.dart';

import 'package:food_zone/features/main/home/data/models/offers_response.dart';

class MealOfferImage extends StatelessWidget {
  const MealOfferImage({super.key, required this.images});

  final List<OfferImage> images;

  @override
  Widget build(BuildContext context) {
    final image = images..shuffle();
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(top: 2.h),
      width: context.widthByValue(144),
      height: context.heightByValue(100),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          OptimizedImageLoader(
            imageUrl: image.first.url,
            height: 100,
            width: 350,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
