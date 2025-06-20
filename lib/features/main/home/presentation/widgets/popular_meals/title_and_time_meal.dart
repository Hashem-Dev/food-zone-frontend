import 'package:food_zone/core/global_widgets/animated_over_flow_text.dart';
import 'package:food_zone/core/global_widgets/text_time.dart';
import 'package:food_zone/exports.dart';

class TitleAndTimeMeal extends StatelessWidget {
  const TitleAndTimeMeal({
    super.key,
    required this.mealTitle,
    required this.mealTime,
  });

  final String mealTitle;
  final String mealTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OverFlowAnimatedText(
            text: mealTitle,
            textStyle: context.textStyle.titleLarge!.copyWith(fontSize: 12.sp),
          ),
        ),
        addHorizontalSpace(10),
        TextTime(mealTime: mealTime),
      ],
    );
  }
}
