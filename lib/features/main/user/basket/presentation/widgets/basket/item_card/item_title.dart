import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({super.key, required this.title});

  final Description title;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.isEn ? title.en : title.ar,
      style: context.textStyle.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      ),
    );
  }
}
