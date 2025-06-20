import 'package:food_zone/exports.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.rate,
    this.fontSize = 12,
    this.iconSize = 15,
    this.textColor,
  });

  final double rate;
  final double fontSize;
  final double iconSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star_rounded,
          color: secondary500,
          size: iconSize.sp,
        ),
        addHorizontalSpace(4),
        Text(
          rate.toStringAsFixed(1),
          style: context.textStyle.titleSmall!.copyWith(
            fontSize: fontSize.sp,
            color: textColor,
          ),
        )
      ],
    );
  }
}
