import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/config/theme/colors.dart';
import 'package:get/get.dart';

import '../../manager/offers.dart';

class OffersIndicators extends StatelessWidget {
  const OffersIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = Get.put(OffersLogic());

    return Obx(
      () => SizedBox(
        width: 42.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (index) {
            final page = offers.index;
            final bool samePosition = page == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: samePosition ? 18.w : 6.w,
              height: 6.w,
              decoration: BoxDecoration(
                color: samePosition ? primary500 : neutral100,
                borderRadius: BorderRadius.circular(6.r),
              ),
            );
          }),
        ),
      ),
    );
  }
}
