import 'dart:convert';

/// Converts a [LoginRequest] object into a JSON string.
///
/// @param data The [LoginRequest] object to be converted.
/// @returns A JSON string representation of the [LoginRequest] object.
String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

/// A model class representing a login request.
///
/// This class is used to encapsulate the data required for a login request,
/// including the user's email and password. It provides methods to convert
/// to and from JSON format.
class LoginRequest {
  final String email;
  final String password;
  final String deviceToken;
  final String deviceAuthKey;

  LoginRequest({
    required this.email,
    required this.password,
    required this.deviceToken,
    required this.deviceAuthKey,
  });

  /// Converts the [LoginRequest] object into a JSON map.
  ///
  /// @returns A JSON map representation of the [LoginRequest] object.
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "deviceToken": deviceToken,
        "deviceAuthKey": deviceAuthKey,
      };
}
