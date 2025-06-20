import 'package:food_zone/core/global_widgets/social_icon.dart';
import 'package:food_zone/core/services/google_authentication.dart';
import 'package:food_zone/exports.dart';

/// A widget that provides social media authentication options for registration.
///
/// This widget displays a Google authentication icon and handles the
/// registration process when the icon is tapped.
class RegisterSocialIcons extends StatelessWidget {
  /// Creates a [RegisterSocialIcons] widget.
  ///
  /// The [key] parameter is optional and can be used to control the widget's
  /// state.
  const RegisterSocialIcons({super.key});

  /// Builds the widget tree for the [RegisterSocialIcons] widget.
  ///
  /// This method creates a [GestureDetector] that wraps a [GoogleAuth] widget.
  /// When the [GestureDetector] is tapped, it triggers the Google registration
  /// process.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] tree containing the social authentication icons.
  @override
  Widget build(BuildContext context) {
    final googleAuth = FGoogleAuthentication();

    return GestureDetector(
      onTap: () async => await googleAuth.registerWithGoogle(),
      child: const GoogleAuth(),
    );
  }
}
