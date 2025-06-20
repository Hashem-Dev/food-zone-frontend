import 'package:food_zone/exports.dart';

class ListFavoriteShimmer extends StatelessWidget {
  const ListFavoriteShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: context.heightByValue(12)),
            child: ShimmerContainer(
              width: context.width,
              height: context.heightByValue(140),
            ),
          );
        });
  }
}
