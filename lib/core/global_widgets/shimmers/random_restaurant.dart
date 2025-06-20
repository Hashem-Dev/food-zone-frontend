import 'package:food_zone/exports.dart';

/// A widget that displays a shimmer effect for a random restaurant.
///
/// This widget is used as a placeholder while the actual restaurant data is being loaded.
/// It provides a visual indication to the user that content is being fetched.
class RandomRestaurantShimmer extends StatelessWidget {
  const RandomRestaurantShimmer({super.key});

  @override

  /// Builds the shimmer effect widget.
  ///
  /// This method constructs the layout of the shimmer effect, which includes
  /// a container with a shadow, padding, and a row of shimmer containers.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [SizedBox] containing the shimmer effect layout.
  ///
  /// The returned [SizedBox] is used within a Flutter app to display a loading
  /// placeholder for a random restaurant, enhancing the user experience by
  /// indicating that content is being loaded.
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: context.w,
      child: ContainerWithShadow(
        radius: 12,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShimmerContainer(width: 100.w, height: 90.h),
              addHorizontalSpace(8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleShimmer(radius: 12),
                        addHorizontalSpace(5),
                        ShimmerContainer(width: 90.w, height: 12.h),
                        const Spacer(),
                        ShimmerContainer(width: 75.w, height: 12.h),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShimmerContainer(width: 70.w, height: 15),
                        ShimmerContainer(width: 100.w, height: 15),
                      ],
                    ),
                    ShimmerContainer(width: context.w, height: 15),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
