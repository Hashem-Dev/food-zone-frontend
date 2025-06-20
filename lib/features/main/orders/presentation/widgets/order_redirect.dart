import 'package:food_zone/exports.dart';

class OrderRedirect extends StatelessWidget {
  const OrderRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'To view your orders please login.',
              style: context.textStyle.displayLarge!
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            addVerticalSpace(context.heightByValue(24)),
            const AppRedirect(),
          ],
        ),
      ),
    );
  }
}
