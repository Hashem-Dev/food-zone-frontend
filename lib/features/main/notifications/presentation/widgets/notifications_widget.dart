import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/notifications/data/models/notification_response.dart';
import 'package:food_zone/features/main/notifications/presentation/widgets/notification_card/notification_card.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
    required this.notifications,
    required this.title,
    required this.reFetch,
  });

  final List<NotificationData> notifications;
  final String title;
  final void Function() reFetch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.heightByValue(16),
      children: [
        Text(
          title,
          style: context.textStyle.displaySmall!
              .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),
        ...List.generate(notifications.length, (index) {
          final notification = notifications[index];
          return NotificationCard(
            notification: notification,
            reFetch: reFetch,
          );
        })
      ],
    );
  }
}
