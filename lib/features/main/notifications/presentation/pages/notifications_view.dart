import 'package:food_zone/core/global_widgets/search_bar.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/notifications/data/repositories/fetch_notifications_hook.dart';
import 'package:food_zone/features/main/notifications/presentation/widgets/notifications_widget.dart';

class NotificationsView extends HookWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationHook = userNotificationHook();
    final notifications = notificationHook?.notifications;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: context.textStyle.displaySmall!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
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
                        await readAllNotifications();
                        notificationHook?.reFetch();
                      },
                      value: 'read-all',
                      child: Row(
                        spacing: context.widthByValue(5),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            SolarIconsOutline.chatRead,
                            size: 20.sp,
                          ),
                          const Text(
                            'Read all',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        await deleteAllNotifications();
                        notificationHook?.reFetch();
                      },
                      value: 'delete-all',
                      child: Row(
                        spacing: context.widthByValue(5),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            SolarIconsOutline.trashBinMinimalistic,
                            size: 20.sp,
                          ),
                          const Text(
                            'Delete all',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              child: const Icon(Icons.more_vert_rounded),
            ),
          )
        ],
      ),
      body: Center(
        child: prefs.refreshToken.isEmpty
            ? const AppRedirect()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: notifications == null
                    ? const Text('Empty')
                    : AppRefreshIndicator(
                        icon: SolarIconsOutline.bell,
                        refresh: () async => notificationHook.reFetch(),
                        child: notificationHook!.loading
                            ? const Loading()
                            : SingleChildScrollView(
                                child: Column(
                                  spacing: context.heightByValue(16),
                                  children: <Widget>[
                                    const AppSearchBar(),
                                    if (notifications.today.isNotEmpty)
                                      NotificationsWidget(
                                        title: 'Today',
                                        notifications: notifications.today,
                                        reFetch: notificationHook.reFetch,
                                      ),
                                    if (notifications.yesterday.isNotEmpty)
                                      NotificationsWidget(
                                        title: 'Yesterday',
                                        notifications: notifications.yesterday,
                                        reFetch: notificationHook.reFetch,
                                      ),
                                    if (notifications.lastWeek.isNotEmpty)
                                      NotificationsWidget(
                                        title: 'Last Week',
                                        notifications: notifications.lastWeek,
                                        reFetch: notificationHook.reFetch,
                                      ),
                                    if (notifications.olderThanWeek.isNotEmpty)
                                      NotificationsWidget(
                                        title: 'Older',
                                        notifications:
                                            notifications.olderThanWeek,
                                        reFetch: notificationHook.reFetch,
                                      ),
                                    addVerticalSpace(100)
                                  ],
                                ),
                              ),
                      ),
              ),
      ),
    );
  }
}
