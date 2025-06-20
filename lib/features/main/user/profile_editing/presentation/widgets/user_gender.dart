import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/manager/edit_profile.dart';

class UserGender extends StatelessWidget {
  const UserGender({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileController profileController = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender'),
        addVerticalSpace(context.heightByValue(8)),
        Obx(() {
          final gender = profileController.gender;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.appTheme.inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: context.isDarkMode ? neutral400 : neutral50,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: const Text(
                      'Male',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Radio<String>(
                      activeColor: primary500,
                      visualDensity: VisualDensity.compact,
                      value: 'male',
                      groupValue: gender,
                      onChanged: (value) {
                        profileController.selectGender(value!);
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.appTheme.inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: context.isDarkMode ? neutral400 : neutral50,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: const Text(
                      'Female',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Radio<String>(
                      activeColor: primary500,
                      visualDensity: VisualDensity.compact,
                      value: 'female',
                      groupValue: gender,
                      onChanged: (value) {
                        profileController.selectGender(value!);
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
