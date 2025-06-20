import 'package:food_zone/exports.dart';

class ReviewsListShimmer extends StatelessWidget {
  const ReviewsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleShimmer(radius: 25),
                    addHorizontalSpace(context.widthByValue(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ShimmerContainer(
                          width: context.widthByValue(120),
                          height: context.heightByValue(15),
                        ),
                        addVerticalSpace(5),
                        ShimmerContainer(
                          width: context.widthByValue(75),
                          height: context.heightByValue(12),
                        ),
                      ],
                    ),
                  ],
                ),
                addVerticalSpace(context.heightByValue(10)),
                ShimmerContainer(width: context.width, height: 50),
                addVerticalSpace(context.heightByValue(20)),
              ],
            );
          }),
    );
  }
}
