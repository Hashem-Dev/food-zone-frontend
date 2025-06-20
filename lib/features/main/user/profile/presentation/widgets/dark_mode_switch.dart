import 'package:food_zone/core/global_widgets/app_drop_down.dart';

import 'package:food_zone/exports.dart';

class ThemeModeDropDown extends StatelessWidget {
  const ThemeModeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Dark Mode',
        style: context.textStyle.displaySmall!.copyWith(fontSize: 16.sp),
      ),
      trailing: AppDropDown(
        onChanged: (value) {
          preferencesController.changeThemeMode(value!);
        },
        value: preferencesController.getThemeModeText(),
        items: const [
          DropdownMenuItem(value: 'system', child: Text('System')),
          DropdownMenuItem(value: 'light', child: Text('Light')),
          DropdownMenuItem(value: 'dark', child: Text('Dark')),
        ],
      ),
    );
  }
}
