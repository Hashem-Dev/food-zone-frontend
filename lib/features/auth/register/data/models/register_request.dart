import 'dart:convert';

import 'package:food_zone/exports.dart';

/// Converts a [RegisterRequest] object to a JSON string.
///
/// @param data The [RegisterRequest] object to be converted.
/// @returns A JSON string representation of the [RegisterRequest] object.
String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

/// A model class representing a registration request.
///
/// This class is used to encapsulate the data required for a user registration
/// request, including the username, email, password, device token, and device
/// authentication key.
class RegisterRequest {
  /// The username of the user.
  final String username;

  /// The email address of the user.
  final String email;

  /// The password of the user.
  final String password;

  /// The device token for push notifications.
  final String deviceToken;

  /// The device authentication key.
  final String deviceAuthKey;

  /// Creates a new [RegisterRequest] instance.
  ///
  /// @param username The username of the user.
  /// @param email The email address of the user.
  /// @param password The password of the user.
  /// @param deviceToken The device token for push notifications.
  /// @param deviceAuthKey The device authentication key.
  RegisterRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.deviceToken,
    required this.deviceAuthKey,
  });

  /// Converts the [RegisterRequest] object to a JSON map.
  ///
  /// @returns A map containing the JSON representation of the [RegisterRequest] object.
  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "deviceToken": deviceToken,
        "deviceAuthKey": deviceAuthKey,
      };
}
