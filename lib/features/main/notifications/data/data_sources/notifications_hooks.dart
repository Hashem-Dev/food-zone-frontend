import 'dart:ui';

import 'package:food_zone/features/main/notifications/data/models/notification_response.dart';

class NotificationsHooks {
  final NotificationsResponse? notifications;
  final bool loading;
  final VoidCallback reFetch;

  NotificationsHooks({
    required this.notifications,
    required this.loading,
    required this.reFetch,
  });
}
