import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/core/global_widgets/shimmers/shimmer_container.dart';

import '../container_with_shadow.dart';
import 'circle_shimmer.dart';

/// A widget that displays a grid of shimmer effects to indicate loading categories.
///
/// This widget is typically used as a placeholder while category data is being fetched.
/// It creates a grid with a fixed number of shimmer items, each consisting of a circular
/// shimmer and a rectangular shimmer.
class CategoryShimmer extends StatelessWidget {
  /// Creates a [CategoryShimmer] widget.
  ///
  /// The [generate] parameter specifies the number of shimmer items to generate.
  const CategoryShimmer({super.key, this.generate = 8});

  /// The number of shimmer items to generate.
  final int generate;

  /// Builds the [CategoryShimmer] widget.
  ///
  /// This method returns a [GridView] containing a fixed number of shimmer items.
  /// Each item consists of a [ContainerWithShadow] that contains a [CircleShimmer]
  /// and a [ShimmerContainer].
  ///
  /// @param context The build context.
  /// @returns A [GridView] widget displaying shimmer effects.
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 24.h,
        crossAxisSpacing: 24.w,
      ),
      children: List.generate(
        generate,
        (index) => ContainerWithShadow(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleShimmer(radius: 18),
              ShimmerContainer(width: 50.w, height: 10.h)
            ],
          ),
        ),
      ),
    );
  }
}
