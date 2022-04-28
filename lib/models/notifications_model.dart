import 'dart:convert';

class NotificationModel {
  NotificationModel({
    required this.id,
    required this.userId,
    required this.message,
    required this.type,
    required this.image,
    required this.notificationData,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int userId;
  final String message;
  final String type;
  final String image;
  final Map notificationData;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        userId: json["user_id"],
        message: json["message"],
        type: json["type"],
        image: json["image"],
        notificationData: jsonDecode(json["notification_data"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "message": message,
        "type": type,
        "image": image,
        "notification_data": jsonEncode(notificationData),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
