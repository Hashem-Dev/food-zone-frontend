import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/core/global_widgets/shimmers/shimmer_container.dart';
import 'package:food_zone/core/utils/extensions.dart';

import '../../utils/set_space.dart';
import '../container_with_shadow.dart';
import 'circle_shimmer.dart';

/// A widget that displays a shimmering placeholder for a list of meal items.
///
/// This widget is used to indicate that meal items are being loaded or processed.
/// It displays a horizontal list of shimmering containers that mimic the appearance
/// of meal items, providing a visual cue to the user that content is loading.
class MealShimmer extends StatelessWidget {
  /// Creates a [MealShimmer] widget.
  ///
  /// The [itemCount] parameter specifies the number of shimmering meal items to display.
  const MealShimmer({super.key, this.itemCount = 5});

  /// The number of shimmering meal items to display.
  final int itemCount;

  /// Builds the [MealShimmer] widget.
  ///
  /// This method constructs a horizontal [ListView] containing a specified number of
  /// shimmering meal item placeholders. Each placeholder consists of a container with
  /// a shadow, and within it, various shimmering containers arranged to resemble
  /// the layout of a meal item.
  ///
  /// @param context The build context.
  /// @returns A [Widget] representing the shimmering meal items.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, index) => Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 15.w, 5.h),
        width: 180.w,
        height: 186.h,
        child: ContainerWithShadow(
          radius: 12,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShimmerContainer(width: context.w, height: 100.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerContainer(width: 100.w, height: 12.h),
                    ShimmerContainer(width: 40.w, height: 12.h),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerContainer(width: 80.w, height: 18.h),
                    ShimmerContainer(width: 50.w, height: 12.h),
                  ],
                ),
                Row(
                  children: [
                    const CircleShimmer(radius: 10),
                    addHorizontalSpace(5),
                    ShimmerContainer(width: 75.w, height: 12.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
