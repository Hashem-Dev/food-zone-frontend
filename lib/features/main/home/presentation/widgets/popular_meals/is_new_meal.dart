import 'package:food_zone/exports.dart';

class IsNewMeal extends StatelessWidget {
  const IsNewMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.r),
        ),
        color: primary700,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'New',
            style: context.textStyle.titleSmall!.copyWith(
              color: primaryWhite,
              fontWeight: FontWeight.w700,
            ),
          ),
          addHorizontalSpace(3),
          const Icon(
            SolarIconsBold.tagPrice,
            size: 10,
            color: primaryWhite,
          ),
        ],
      ),
    )
        // .animate(onPlay: (controller) => controller.repeat()).shimmer(
        //   duration: 2000.ms,
        //   delay: 2000.ms,
        //   size: 1,
        //   blendMode: BlendMode.plus,
        // )
        ;
  }
}
