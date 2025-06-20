import 'package:food_zone/core/global_widgets/social_icon.dart';
import 'package:food_zone/core/services/google_authentication.dart';

import 'package:food_zone/exports.dart';

class SocialAuthentication extends StatelessWidget {
  const SocialAuthentication({super.key});

  @override

  /// Builds a widget that provides social authentication options.
  ///
  /// This widget creates a row containing social authentication icons.
  /// Currently, it supports Google authentication. When the Google icon
  /// is tapped, it triggers the Google login process.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Widget] containing a row of social authentication icons.
  ///
  /// The returned [Widget] is used within a Flutter app to display
  /// social authentication options to the user. It is typically included
  /// as part of a larger authentication or login screen.
  Widget build(BuildContext context) {
    final googleAuth = FGoogleAuthentication();
    // final facebookAuth = FacebookAuthentication();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async => await googleAuth.loginWithGoogle(),
          child: const GoogleAuth(),
        ),
      ],
    );
  }
}
