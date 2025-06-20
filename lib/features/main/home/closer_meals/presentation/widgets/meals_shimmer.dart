import 'package:food_zone/exports.dart';

/// A widget that displays a grid of shimmer effects to indicate loading meals.
///
/// This widget is used as a placeholder while the actual meal data is being fetched.
/// It creates a grid with a fixed number of shimmer containers to simulate the layout
/// of the meal items.
///
/// {@tool snippet}
/// This example shows how to use the [GridMealsShimmer] widget:
///
/// ```dart
/// GridMealsShimmer();
/// ```
/// {@end-tool}
class GridMealsShimmer extends StatelessWidget {
  /// Creates a [GridMealsShimmer] widget.
  const GridMealsShimmer({super.key});

  /// Builds the [GridMealsShimmer] widget.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Widget] that displays a grid of shimmer effects.
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 25.h,
        mainAxisExtent: 200.h,
        crossAxisSpacing: 10.w,
      ),
      itemCount: 8,
      itemBuilder: (BuildContext context, index) => SizedBox(
        width: context.w * 0.45802,
        child: ContainerWithShadow(
          radius: 12,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShimmerContainer(width: context.w, height: context.h * 0.11737),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerContainer(
                      width: context.w * 0.11737,
                      height: context.h * 0.01408,
                    ),
                    ShimmerContainer(
                      width: context.w * 0.10178,
                      height: context.h * 0.01408,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerContainer(
                      width: context.w * 0.20356,
                      height: context.h * 0.02112,
                    ),
                    ShimmerContainer(
                      width: context.w * 0.12723,
                      height: context.h * 0.01408,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CircleShimmer(radius: 10),
                    addHorizontalSpace(5),
                    ShimmerContainer(
                      width: context.w * 0.19084,
                      height: context.h * 0.01408,
                    ),
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
