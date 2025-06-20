import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/presentation/pages/main_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class FGoogleAuthentication {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'profile',
    'https://www.googleapis.com/auth/user.phonenumbers.read'
  ]);
  final Uri _url = Uri.parse('$baseUrl/users/auth/google');
  final Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Accept-Language": prefs.userLanguage,
  };

  /// Registers a new user using Google Sign-In.
  ///
  /// This function initiates the Google Sign-In process, retrieves the user's
  /// Google account information, and sends it to the server for registration.
  /// If the registration is successful, it saves the access and refresh tokens,
  /// and navigates to the main screen.
  ///
  /// @returns Future<void> - A future that completes when the registration process is done.
  Future<void> registerWithGoogle() async {
    try {
      final GoogleSignInAccount? newUser = await _googleSignIn.signIn();
      if (newUser == null) {
        showErrorSnackBar('Failed with authorize this account');
        return;
      }
      final Map<String, String?> data = {
        "googleId": newUser.id,
        "displayName": newUser.displayName,
        "email": newUser.email,
        "imageUrl": newUser.photoUrl,
        "deviceToken": prefs.deviceToken,
        "deviceAuthKey": prefs.deviceAuthKey,
      };
      final String body = jsonEncode(data);
      final http.Response response =
          await http.post(_url, headers: _headers, body: body);
      final Map decodedBody = jsonDecode(response.body);
      if (response.statusCode == 201) {
        final accessToken = decodedBody['user']['accessToken'];
        final refreshToken = decodedBody['user']['refreshToken'];
        showSuccessSnackBar(decodedBody['message']);
        prefs.saveAccessToken(accessToken);
        prefs.saveRefreshToken(refreshToken);
        prefs.saveUserDate(decodedBody['user'].toString());
        Get.deleteAll(force: true);
        Get.offAll(() => const MainScreen());
      } else {
        showErrorSnackBar(decodedBody['message']);
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// Logs in an existing user using Google Sign-In.
  ///
  /// This function initiates the Google Sign-In process, retrieves the user's
  /// Google account information, and sends it to the server for authentication.
  /// If the authentication is successful, it saves the access and refresh tokens,
  /// and navigates to the main screen.
  ///
  /// @returns Future<void> - A future that completes when the login process is done.
  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user == null) {
        showErrorSnackBar('Failed with authorize this account');
        return;
      }
      final data = {
        "email": user.email,
        "googleId": user.id,
        "deviceToken": prefs.deviceToken,
        "deviceAuthKey": prefs.deviceAuthKey,
      };
      final body = jsonEncode(data);
      final request = http.Request('GET', _url);
      request.body = body;
      request.headers.addAll(_headers);
      final http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final decodedBody = jsonDecode(responseBody);
      if (response.statusCode == 200) {
        final accessToken = decodedBody['user']['accessToken'];
        final refreshToken = decodedBody['user']['refreshToken'];
        prefs.saveAccessToken(accessToken);
        prefs.saveRefreshToken(refreshToken);
        prefs.saveUserDate(responseBody);
        showSuccessSnackBar(decodedBody['message']);
        Get.deleteAll(force: true);
        Get.offAll(() => const MainScreen());
      } else {
        showErrorSnackBar(decodedBody['message']);
        return;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// Logs out the current user from Google Sign-In.
  ///
  /// This function disconnects the current user from Google Sign-In and logs
  /// the logout event.
  ///
  /// @returns Future<void> - A future that completes when the logout process is done.
  Future<void> logout() async {
    final GoogleSignInAccount? logoutUser = await _googleSignIn.disconnect();
    if (logoutUser != null) {
      log('Logged out successfully');
    }
  }
}
