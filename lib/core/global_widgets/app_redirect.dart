import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/pages/login.dart';

class AppRedirect extends StatelessWidget {
  const AppRedirect({super.key});

  @override

  /// Builds the widget tree for the AppRedirect widget.
  ///
  /// This method creates a container with specific width, height, padding, and decoration.
  /// Inside the container, it centers an ElevatedButton that navigates to the LoginView page
  /// when pressed. The button has customized styles for foreground and background colors,
  /// as well as minimum size.
  ///
  /// @param context The BuildContext in which the widget is built.
  /// @returns A Widget that represents the AppRedirect UI component.
  ///
  /// The returned Widget is used within a Flutter app to provide a UI element that allows
  /// users to navigate to the login or registration page.
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: context.heightByValue(100),
      decoration: BoxDecoration(
        color: primary500,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () => Get.offAll(() => const LoginView()),
          style: ElevatedButton.styleFrom(
            foregroundColor: primary500,
            backgroundColor: primaryWhite,
            minimumSize: Size(
              context.width,
              context.heightByValue(53),
            ),
          ),
          child: Text(
            'Login / Register',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
