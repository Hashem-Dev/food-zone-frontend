import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/manager/edit_profile.dart';

class UserDate extends StatelessWidget {
  const UserDate({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileController profileController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Date of brith',
          style: context.textStyle.displaySmall!
              .copyWith(fontSize: !context.isPhone ? 8.sp : null),
        ),
        addVerticalSpace(context.heightByValue(8)),
        TextFormField(
          keyboardType: TextInputType.none,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          focusNode: profileController.userDateNode,
          onTap: () async {
            await profileController.datePicker(context);
          },
          controller: profileController.userDate,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              SolarIconsBold.calendarMinimalistic,
              color: neutral100,
            ),
            suffixIcon: GestureDetector(
              onTap: () async => await profileController.datePicker(context),
              child: const Icon(
                SolarIconsOutline.calendarAdd,
                color: neutral100,
              ),
            ),
            hintText: 'Date',
            hintStyle: context.appTheme.inputDecorationTheme.hintStyle!
                .copyWith(fontSize: !context.isPhone ? 8.sp : null),
          ),
        ),
      ],
    );
  }
}
