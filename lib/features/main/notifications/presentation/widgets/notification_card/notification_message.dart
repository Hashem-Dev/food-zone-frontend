import 'package:food_zone/exports.dart';

class NotificationMessage extends StatelessWidget {
  const NotificationMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: context.textStyle.displaySmall!.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
