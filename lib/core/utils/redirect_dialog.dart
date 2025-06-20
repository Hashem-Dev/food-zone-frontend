import 'package:flutter/cupertino.dart';
import 'package:food_zone/exports.dart';

import 'package:food_zone/features/auth/login/presentation/pages/login.dart';
import 'package:food_zone/features/auth/register/presentation/pages/register.dart';

/// Displays a Cupertino modal popup with options to redirect the user to the login or register page.
///
/// This function is used to prompt users who are not logged in to either log in or register.
/// It shows a modal popup with two actions: "Register" and "Login". Selecting an action will
/// navigate the user to the respective page and clear the navigation stack.
///
/// @param context The BuildContext in which the dialog is displayed.
/// @returns void
void redirectDialog(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: Text(
          'You\'r not logged in',
          style: TextStyle(fontSize: 14.sp),
        ),
        message: Text(
          'Select option to continue',
          style: TextStyle(fontSize: 16.sp),
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () {
              Get.deleteAll(force: true);
              Get.offAll(() => const RegisterView());
            },
            child: const Text(
              'Register',
              style: TextStyle(color: primary500),
            ),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Get.offAll(() {
              Get.deleteAll(force: true);
              return const LoginView();
            }),
            child: const Text(
              'Login',
              style: TextStyle(color: primary500),
            ),
          ),
        ],
      );
    },
  );
}
