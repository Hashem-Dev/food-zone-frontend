import 'package:flutter/cupertino.dart';
import 'package:food_zone/exports.dart';

class ConfirmImageDiscard extends StatelessWidget {
  const ConfirmImageDiscard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CupertinoActionSheet(
          title: Text(
            'Discard Changes',
            style: TextStyle(fontSize: 14.sp),
          ),
          message: SizedBox(
            width: context.width,
            child: Column(
              children: [
                Text(
                  'Are you sure to cancel update profile photo?',
                  style: TextStyle(fontSize: 16.sp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Get.back();
                        Get.back();
                        Get.back();
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: primary500),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: primary500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
