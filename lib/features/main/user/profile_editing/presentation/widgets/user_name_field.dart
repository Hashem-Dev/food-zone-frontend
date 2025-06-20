import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/manager/edit_profile.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final UserLogic controller = Get.find();
    final EditProfileController profileController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          context.translate.user_name_title,
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: !context.isPhone ? 8.sp : null,
          ),
        ),
        addVerticalSpace(8),
        TextFormField(
          controller: profileController.userName,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
            if (profileController.userName.text.isEmpty) {
              profileController.userName.text = controller.user.name.en;
            }
          },
          onTap: () {
            if (profileController.userName.text == controller.user.name.en) {
              profileController.userName.clear();
            }
            if (profileController.userEmail.text.isEmpty) {
              profileController.userEmail.text = controller.user.email;
            }
            if (profileController.userPhone.text.isEmpty) {
              profileController.userPhone.text =
                  controller.user.phone.toString();
            }
          },
          onChanged: (value) {},
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
            if (profileController.userName.text.isEmpty) {
              profileController.userName.text = controller.user.name.en;
            }
          },
          onFieldSubmitted: (d) {
            FocusScope.of(context).unfocus();
            if (profileController.userName.text.isEmpty) {
              profileController.userName.text = controller.user.name.en;
            }
          },
          textInputAction: TextInputAction.done,
          cursorHeight: 20.h,
          cursorColor: neutral100,
          maxLines: 1,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              SolarIconsBold.user,
              color: neutral100,
            ),
            hintText: context.translate.hint_user_name,
            hintStyle: context.appTheme.inputDecorationTheme.hintStyle!
                .copyWith(fontSize: !context.isPhone ? 8.sp : null),
          ),
        )
      ],
    );
  }
}
