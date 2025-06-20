import 'package:food_zone/core/global_widgets/app_switch.dart';

import 'package:food_zone/exports.dart';

class AutoUpdateSwitch extends StatelessWidget {
  const AutoUpdateSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Automatically Updated',
        style: context.textStyle.displaySmall!.copyWith(fontSize: 16.sp),
      ),
      trailing: Obx(() {
        final value = preferencesController.autoUpdateState;
        return AppSwitch(
          value: value,
          onChanged: (value) => preferencesController.changeAutoUpdate(),
        );
      }),
    );
  }
}
