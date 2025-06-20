import 'package:food_zone/exports.dart';
import 'l_phone.dart';
import 'p_phone.dart';

/// A stateless widget that represents the phone number view.
///
/// This widget is responsible for displaying the phone number input screen
/// with a responsive layout that adapts to portrait and landscape orientations.
class PhoneNumberView extends StatelessWidget {
  /// Creates a [PhoneNumberView] widget.
  const PhoneNumberView({super.key});

  /// Builds the widget tree for the phone number view.
  ///
  /// This method returns a [Scaffold] widget that contains an [AppBar] and a
  /// [ResponsiveLayout] widget. The [ResponsiveLayout] widget displays
  /// different layouts for portrait and landscape orientations.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] tree representing the phone number view.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ResponsiveLayout(
        portrait: PortraitPhone(),
        landscape: LandscapePhone(),
      ),
    );
  }
}
