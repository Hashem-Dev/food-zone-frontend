import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/pages/profile_editing_view.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ProfileEditingView()),
      child: Container(
        width: context.widthByValue(42),
        height: context.widthByValue(42),
        decoration: const BoxDecoration(
          color: primary500,
          shape: BoxShape.circle,
        ),
        child: const Icon(SolarIconsBold.pen, color: primaryWhite),
      ),
    );
  }
}
