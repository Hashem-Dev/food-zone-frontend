import 'package:food_zone/exports.dart';

class CardSubtitle extends StatelessWidget {
  const CardSubtitle(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name.toUpperCase(),
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textStyle.displaySmall!.copyWith(
        fontSize: 12.sp,
        color: primary500,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
