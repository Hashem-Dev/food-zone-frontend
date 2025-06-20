import 'package:food_zone/exports.dart';

class EditItemButton extends StatelessWidget {
  const EditItemButton({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        SolarIconsBold.pen,
        size: 18.sp,
        color: neutral100,
      ),
    );
  }
}
