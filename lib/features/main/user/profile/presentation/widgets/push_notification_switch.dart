import 'package:food_zone/core/global_widgets/app_switch.dart';
import 'package:food_zone/exports.dart';

class PushNotificationSwitch extends StatelessWidget {
  const PushNotificationSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Push Notification',
        style: context.textStyle.displaySmall!.copyWith(
          fontSize: 16.sp,
        ),
      ),
      trailing: Obx(() {
        final value = preferencesController.pushNotificationState;
        return AppSwitch(
          onChanged: (value) => preferencesController.updatePushNotification(),
          value: value,
        );
      }),
    );
  }
}
