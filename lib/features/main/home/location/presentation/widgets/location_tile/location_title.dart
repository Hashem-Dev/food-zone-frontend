import 'package:food_zone/exports.dart';

class LocationTitle extends StatelessWidget {
  const LocationTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textStyle.displaySmall!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
    );
  }
}
