import 'package:food_zone/exports.dart';

class SearchLoadingShimmer extends StatelessWidget {
  const SearchLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.heightByValue(8)),
      child: ContainerWithShadow(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          height: context.heightByValue(250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) {
                return ShimmerContainer(
                  width: context.width,
                  height: context.heightByValue(45),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
