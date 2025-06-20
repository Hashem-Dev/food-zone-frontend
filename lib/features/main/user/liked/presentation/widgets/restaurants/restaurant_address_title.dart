import 'package:food_zone/core/global_widgets/animated_over_flow_text.dart';
import 'package:food_zone/exports.dart';

class RestaurantAddressTitle extends StatelessWidget {
  const RestaurantAddressTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return OverFlowAnimatedText(
      text: title,
      textStyle: TextStyle(
        color: primary500,
        fontWeight: FontWeight.w700,
        fontSize: 12.sp,
      ),
    );
  }
}
