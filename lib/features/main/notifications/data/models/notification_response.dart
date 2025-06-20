import 'dart:convert';

NotificationsResponse notificationsResponseFromJson(String str) =>
    NotificationsResponse.fromJson(json.decode(str));

String notificationsResponseToJson(NotificationsResponse data) =>
    json.encode(data.toJson());

class NotificationsResponse {
  final List<NotificationData> today;
  final List<NotificationData> yesterday;
  final List<NotificationData> lastWeek;
  final List<NotificationData> olderThanWeek;

  NotificationsResponse({
    required this.today,
    required this.yesterday,
    required this.lastWeek,
    required this.olderThanWeek,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) {
    return NotificationsResponse(
      today: List<NotificationData>.from(json["today"].map((x) {
        return NotificationData.fromJson(x);
      })),
      yesterday: List<NotificationData>.from(json["yesterday"].map((x) {
        return NotificationData.fromJson(x);
      })),
      lastWeek: List<NotificationData>.from(json["lastWeek"].map((x) {
        return NotificationData.fromJson(x);
      })),
      olderThanWeek: List<NotificationData>.from(
        json["olderThanWeek"].map((x) {
          return NotificationData.fromJson(x);
        }),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "today": List<dynamic>.from(today.map((x) => x.toJson())),
      "yesterday": List<dynamic>.from(yesterday.map((x) => x.toJson())),
      "lastWeek": List<dynamic>.from(lastWeek.map((x) => x.toJson())),
      "olderThanWeek": List<dynamic>.from(olderThanWeek.map((x) => x.toJson())),
    };
  }
}

class NotificationData {
  final String id;
  final String user;
  final String title;
  final String message;
  final NotificationIcon icon;
  final String type;
  final int priority;
  final bool isRead;
  final DateTime createdAt;

  NotificationData({
    required this.id,
    required this.user,
    required this.title,
    required this.message,
    required this.icon,
    required this.type,
    required this.priority,
    required this.isRead,
    required this.createdAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['_id'],
      user: json["user"],
      title: json["title"],
      message: json["message"],
      icon: NotificationIcon.fromJson(json["icon"]),
      type: json["type"],
      priority: json["priority"],
      isRead: json["isRead"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "user": user,
      "title": title,
      "message": message,
      "icon": icon.toJson(),
      "type": type,
      "priority": priority,
      "isRead": isRead,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}

class NotificationIcon {
  final int codePoint;
  final String fontFamily;
  final String fontPackage;
  final String color;

  NotificationIcon({
    required this.codePoint,
    required this.fontFamily,
    required this.fontPackage,
    required this.color,
  });

  factory NotificationIcon.fromJson(Map<String, dynamic> json) {
    return NotificationIcon(
      codePoint: json["codePoint"],
      fontFamily: json["fontFamily"],
      fontPackage: json["fontPackage"],
      color: json["color"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "codePoint": codePoint,
      "fontFamily": fontFamily,
      "fontPackage": fontPackage,
      "color": color,
    };
  }
}
