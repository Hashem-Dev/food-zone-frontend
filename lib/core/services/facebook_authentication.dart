// import 'dart:developer';
//
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:food_zone/exports.dart';
// import 'package:food_zone/features/main/presentation/pages/main_screen.dart';
//
// import 'package:http/http.dart' as http;
//
// class FacebookAuthentication {
//   final headers = {
//     'Content-Type': 'application/json',
//     'Accept-Language': prefs.userLanguage
//   };
//
//   final Uri url = Uri.parse('$baseUrl/users/auth/facebook');
//
//   Future<void> registerWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.instance
//             .getUserData(fields: "email,name,picture");
//         final data = {
//           "email": userData['email'],
//           "facebookId": userData['id'],
//           'name': userData['name'],
//           'imageUrl': userData['picture']['data']['url']
//         };
//         final body = jsonEncode(data);
//         final response = await http.post(url, headers: headers, body: body);
//         final decodedBody = jsonDecode(response.body);
//         if (response.statusCode == 201) {
//           final accessToken = decodedBody['user']['accessToken'];
//           final refreshToken = decodedBody['user']['refreshToken'];
//           showSuccessSnackBar(decodedBody['message']);
//           prefs.saveAccessToken(accessToken);
//           prefs.saveRefreshToken(refreshToken);
//           prefs.saveUserDate(decodedBody['user'].toString());
//           Get.deleteAll(force: true);
//           Get.offAll(() => const MainScreen());
//         } else {
//           showErrorSnackBar(decodedBody['message']);
//           return;
//         }
//       } else {
//         log(result.status.toString());
//       }
//     } catch (error) {
//       log(error.toString());
//       rethrow;
//     }
//   }
//
//   Future<void> loginWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//       if (result.status == LoginStatus.success) {
//         final Map<String, dynamic> userData =
//             await FacebookAuth.instance.getUserData(fields: "email");
//         final Map<String, dynamic> data = {
//           "email": userData['email'],
//           "facebookId": userData['id']
//         };
//         final String body = jsonEncode(data);
//         final http.Request request = http.Request('GET', url);
//         request.body = body;
//         request.headers.addAll(headers);
//         final http.StreamedResponse response = await request.send();
//         final responseBody = jsonDecode(await response.stream.bytesToString());
//         if (response.statusCode == 200) {
//           final accessToken = responseBody['user']['accessToken'];
//           final refreshToken = responseBody['user']['refreshToken'];
//           prefs.saveAccessToken(accessToken);
//           prefs.saveRefreshToken(refreshToken);
//           prefs.saveUserDate(responseBody.toString());
//           showSuccessSnackBar(responseBody['message']);
//           Get.deleteAll(force: true);
//           Get.offAll(() => const MainScreen());
//         } else {
//           showErrorSnackBar(responseBody['message']);
//           return;
//         }
//       }
//     } catch (error) {
//       log(error.toString());
//       rethrow;
//     }
//   }
// }
