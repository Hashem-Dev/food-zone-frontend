import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/update_profile_bottom_sheet/update_profile_bottom_sheet.dart';

class AddAvatarButton extends StatelessWidget {
  const AddAvatarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showUpdateProfilePhotoSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.isDarkMode ? neutral500 : primaryWhite,
          shape: BoxShape.circle,
          border: Border.all(width: .3, color: primary500),
        ),
        width: context.widthByValue(36),
        height: context.widthByValue(36),
        child: Icon(
          SolarIconsBold.cameraMinimalistic,
          color: primary500,
          size: 25.sp,
        ),
      ),
    );
  }
}
