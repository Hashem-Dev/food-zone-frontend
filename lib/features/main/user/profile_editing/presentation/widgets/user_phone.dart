import 'package:food_zone/exports.dart';

import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/manager/edit_profile.dart';

class UserPhone extends StatelessWidget {
  const UserPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(EditProfileController());
    final UserLogic controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone',
          style: context.textStyle.displaySmall!
              .copyWith(fontSize: !context.isPhone ? 8.sp : null),
        ),
        addVerticalSpace(context.heightByValue(8)),
        TextFormField(
          controller: profileController.userPhone,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
            if (profileController.userPhone.text.isEmpty) {
              profileController.userPhone.text =
                  controller.user.phone.toString();
            }
          },
          onTap: () {
            if (profileController.userPhone.text ==
                controller.user.phone.toString()) {
              profileController.userPhone.clear();
            }
            if (profileController.userEmail.text.isEmpty) {
              profileController.userEmail.text = controller.user.email;
            }
            if (profileController.userName.text.isEmpty) {
              profileController.userName.text = controller.user.name.en;
            }
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
            if (profileController.userPhone.text.isEmpty) {
              profileController.userPhone.text =
                  controller.user.phone.toString();
            }
          },
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
            if (profileController.userPhone.text.isEmpty) {
              profileController.userPhone.text =
                  controller.user.phone.toString();
            }
          },
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixText: '+963 ',
            suffix: SizedBox(
              child: SvgPicture.asset(
                'assets/icons/syrian_flag.svg',
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
            prefixIcon: const Icon(
              SolarIconsBold.phoneRounded,
              color: neutral100,
            ),
          ),
        ),
      ],
    );
  }
}
