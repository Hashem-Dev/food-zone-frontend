import 'package:food_zone/exports.dart';

class NotificationTitle extends StatelessWidget {
  const NotificationTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textStyle.displaySmall!.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
