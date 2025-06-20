import 'package:food_zone/exports.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Basket',
      style: context.textStyle.displaySmall!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
      ),
    );
  }
}
