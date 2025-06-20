import 'package:food_zone/exports.dart';

class PromotionShimmer extends StatelessWidget {
  const PromotionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: context.heightByValue(66),
            width: context.width,
            margin: EdgeInsets.only(bottom: context.heightByValue(12)),
            child: Row(
              spacing: context.widthByValue(12),
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const ShimmerContainer(width: 42, height: 42),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ShimmerContainer(width: 120, height: 12),
                    ShimmerContainer(width: 220, height: 12),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
