import 'package:flutter/cupertino.dart';

import '../../exports.dart';

/// Displays a Cupertino-style alert dialog with a title, content, and two buttons.
///
/// This function shows a CupertinoAlertDialog with a customizable title, content,
/// and two buttons: one for confirming an action and one for canceling. The confirm
/// button's label can be customized through the [onTapTitle] parameter.
///
/// @param context The BuildContext in which to display the dialog.
/// @param title The title of the alert dialog.
/// @param content The content of the alert dialog.
/// @param onTap The callback function to execute when the confirm button is pressed.
/// @param onCancel The callback function to execute when the cancel button is pressed.
/// @param onTapTitle The label for the confirm button. Defaults to 'Confirm'.
///
/// @returns A Future that completes when the dialog is dismissed.
Future showAppAlert(
  BuildContext context, {
  required String title,
  required String content,
  required Function() onTap,
  required Function() onCancel,
  String onTapTitle = 'Confirm',
}) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title, style: TextStyle(fontSize: 16.sp)),
          content: Text(content, style: TextStyle(fontSize: 14.sp)),
          actions: [
            CupertinoButton(
              onPressed: onTap,
              child: Text(
                onTapTitle,
                style: const TextStyle(color: primary500),
              ),
            ),
            CupertinoButton(
              onPressed: onCancel,
              child: const Text('Cancel', style: TextStyle(color: primary500)),
            ),
          ],
        );
      });
}
