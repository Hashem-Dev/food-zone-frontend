import 'package:food_zone/core/global_widgets/app_drop_down.dart';
import 'package:food_zone/exports.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Language',
        style: context.textStyle.displaySmall!.copyWith(
          fontSize: 16.sp,
        ),
      ),
      visualDensity: VisualDensity.compact,
      trailing: AppDropDown(
          items: const [
            DropdownMenuItem(
              value: 'en',
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text('Arabic'),
            ),
          ],
          value: prefs.userLanguage,
          onChanged: (value) {
            preferencesController.changeLanguage(value!);
          }),
    );
  }
}
