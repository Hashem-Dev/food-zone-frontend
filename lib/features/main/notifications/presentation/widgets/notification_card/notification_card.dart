import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/notifications/data/models/notification_response.dart';
import 'package:food_zone/features/main/notifications/data/repositories/fetch_notifications_hook.dart';
import 'package:food_zone/features/main/notifications/presentation/widgets/notification_card/notification_date.dart';
import 'package:food_zone/features/main/notifications/presentation/widgets/notification_card/notification_icon.dart';
import 'package:food_zone/features/main/notifications/presentation/widgets/notification_card/notification_message.dart';
import 'package:food_zone/features/main/notifications/presentation/widgets/notification_card/notification_title.dart';
import 'package:food_zone/features/main/notifications/presentation/widgets/notification_card/unread_dot.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
    required this.reFetch,
  });

  final NotificationData notification;
  final void Function() reFetch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ListTile(
                  dense: true,
                  visualDensity: VisualDensity.comfortable,
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Row(
                    children: <Widget>[
                      NotificationTitle(title: notification.title),
                      const Spacer(flex: 15),
                      if (!notification.isRead) const UnreadDot(),
                      const Spacer(),
                      GestureDetector(
                        onTapDown: (details) async {
                          await showMenu(
                            context: context,
                            color: context.background,
                            position: RelativeRect.fromLTRB(
                              details.globalPosition.dx,
                              details.globalPosition.dy,
                              details.globalPosition.dx,
                              details.globalPosition.dy,
                            ),
                            menuPadding: EdgeInsets.zero,
                            items: [
                              PopupMenuItem(
                                onTap: () async {
                                  await readSpecificNotification(
                                      notification.id);
                                  reFetch();
                                },
                                value: 'read',
                                child: Row(
                                  spacing: context.widthByValue(5),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      SolarIconsOutline.unread,
                                      size: 20.sp,
                                    ),
                                    const Text(
                                      'Read',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () async {
                                  await deleteSpecificNotification(
                                      notification.id);
                                  reFetch();
                                },
                                value: 'delete',
                                child: Row(
                                  spacing: context.widthByValue(5),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      SolarIconsOutline.trashBinMinimalistic_2,
                                      size: 20.sp,
                                    ),
                                    const Text('Delete'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'report',
                                child: Row(
                                  spacing: context.widthByValue(5),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      SolarIconsOutline.flag,
                                      size: 20.sp,
                                    ),
                                    const Text('Report'),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        child: const Icon(SolarIconsOutline.menuDots),
                      )
                    ],
                  ),
                  subtitle: NotificationMessage(message: notification.message),
                  leading: NotificationBadge(icon: notification.icon),
                ),
                NotificationDate(createdAt: notification.createdAt)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
