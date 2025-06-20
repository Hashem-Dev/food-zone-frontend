import 'package:food_zone/exports.dart';

import 'package:food_zone/features/auth/email/presentation/manager/forgot_password_email.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/landscape/l_email.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_email.dart';

class EmailView extends StatelessWidget {
  const EmailView({super.key});

  @override

  /// Builds the widget tree for the EmailView.
  ///
  /// This method creates a [Scaffold] with an [AppBar] and a body that
  /// displays a loading indicator or a responsive layout based on the
  /// controller's loading state.
  ///
  /// The [ResponsiveLayout] widget displays different widgets for portrait
  /// and landscape orientations.
  ///
  /// @param context The [BuildContext] in which the widget is built.
  /// @returns A [Widget] representing the EmailView screen.
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordEmailController());

    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => controller.loading
            ? const Loading()
            : const ResponsiveLayout(
                portrait: PortraitEmail(),
                landscape: LandscapeEmail(),
              ),
      ),
    );
  }
}
