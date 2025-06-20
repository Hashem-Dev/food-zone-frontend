import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/notifications/data/models/notification_response.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({super.key, required this.icon});

  final NotificationIcon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthByValue(40),
      height: context.widthByValue(40),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: secondary50,
      ),
      child: Icon(
        IconData(
          icon.codePoint,
          fontFamily: icon.fontFamily,
          fontPackage: icon.fontPackage,
        ),
        color: Color(int.parse('0xff${icon.color}')),
      ),
    );
  }
}
