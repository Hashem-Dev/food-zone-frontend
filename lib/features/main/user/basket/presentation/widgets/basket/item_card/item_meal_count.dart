import 'package:food_zone/exports.dart';

class ItemMealCount extends StatelessWidget {
  const ItemMealCount({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      style: context.textStyle.displaySmall!.copyWith(fontSize: 18.sp),
    );
  }
}
