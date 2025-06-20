import 'package:food_zone/exports.dart';


class RestaurantDetailsRateButton extends StatelessWidget {
  const RestaurantDetailsRateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      iconAlignment: IconAlignment.end,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 6.w,
            vertical: 0,
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(primary500),
        foregroundColor: const WidgetStatePropertyAll(primaryWhite),
      ),
      label: Text(
        'Rate',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: Icon(SolarIconsBold.handStars, size: 18.sp),
    );
  }
}
