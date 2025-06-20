import 'package:food_zone/exports.dart';

class LocationSubtitle extends StatelessWidget {
  const LocationSubtitle({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: context.textStyle.displaySmall!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
    );
  }
}
