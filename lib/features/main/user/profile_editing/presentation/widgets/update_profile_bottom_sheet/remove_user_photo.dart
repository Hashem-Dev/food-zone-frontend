import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/manager/edit_profile.dart';

class RemoveUserPhoto extends StatelessWidget {
  const RemoveUserPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileController profileController = Get.find();
    return ListTile(
      title: Text(
        'Remove photo',
        style: context.textStyle.displaySmall!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: GestureDetector(
        onTap: () async {
          await profileController.removeProfileAvatar();
        },
        child: Icon(
          SolarIconsBold.trashBin2,
          color: neutral100,
          size: 20.sp,
        ),
      ),
    );
  }
}
