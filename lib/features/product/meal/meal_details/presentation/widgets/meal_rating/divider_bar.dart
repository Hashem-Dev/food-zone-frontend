import 'package:food_zone/exports.dart';

class DividerBar extends StatelessWidget {
  const DividerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.h),
      width: 1.w,
      decoration: BoxDecoration(
        color: neutral200,
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
  }
}
