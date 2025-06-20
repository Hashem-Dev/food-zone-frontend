import 'package:food_zone/core/global_widgets/app_switch.dart';
import 'package:food_zone/exports.dart';

class SoundSwitch extends StatelessWidget {
  const SoundSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Sound',
        style: context.textStyle.displaySmall!.copyWith(fontSize: 16.sp),
      ),
      trailing: Obx(() {
        final value = preferencesController.appSoundState;
        return AppSwitch(
          value: value,
          onChanged: (value) => preferencesController.updateAppSound(),
        );
      }),
    );
  }
}
