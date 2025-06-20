import 'package:food_zone/exports.dart';
import 'package:intl/intl.dart';

class NotificationDate extends StatelessWidget {
  const NotificationDate({super.key, required this.createdAt});

  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('HH:mm  dd/MM/yyyy').format(createdAt),
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: context.isDarkMode ? neutral300 : neutral400,
      ),
    );
  }
}
