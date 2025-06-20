import 'package:food_zone/exports.dart';

class UnreadDot extends StatelessWidget {
  const UnreadDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthByValue(14),
      height: context.widthByValue(14),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: primaryWhite,
        ),
        color: primary500,
        shape: BoxShape.circle,
      ),
    );
  }
}
