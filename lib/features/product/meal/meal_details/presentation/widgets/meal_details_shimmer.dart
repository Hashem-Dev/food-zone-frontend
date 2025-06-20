import 'package:food_zone/exports.dart';

class MealDetailsShimmer extends StatelessWidget {
  const MealDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.h,
        width: context.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShimmerContainer(width: context.w, height: 300),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(12),
                    ShimmerContainer(width: 250.w, height: 30.h),
                    addVerticalSpace(12),
                    ShimmerContainer(width: 150.w, height: 25.h),
                    addVerticalSpace(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ShimmerContainer(width: 110.w, height: 20.h),
                        ShimmerContainer(width: 150.w, height: 20.h),
                      ],
                    ),
                    addVerticalSpace(12),
                    ShimmerContainer(width: context.w, height: 150.h),
                    addVerticalSpace(12),
                    ShimmerContainer(width: context.w, height: 40.h),
                    addVerticalSpace(12),
                    ...List.generate(5, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ShimmerContainer(width: 140.w, height: 20.h),
                                addVerticalSpace(10),
                                ShimmerContainer(width: 250.w, height: 15.h),
                              ],
                            ),
                            const CircleShimmer(radius: 25)
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
