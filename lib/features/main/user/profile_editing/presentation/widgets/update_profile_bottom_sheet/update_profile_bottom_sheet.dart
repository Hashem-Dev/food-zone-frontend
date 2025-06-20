import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/update_profile_bottom_sheet/remove_user_photo.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/update_profile_bottom_sheet/update_photo_tile.dart';

Future showUpdateProfilePhotoSheet(BuildContext context) async {
  return showModalBottomSheet(
      enableDrag: true,
      showDragHandle: true,
      isDismissible: true,
      backgroundColor: context.background,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: context.heightByValue(120),
          width: context.width,
          child: const Column(
            children: <Widget>[
              UpdatePhotoTile(),
              Spacer(),
              RemoveUserPhoto(),
            ],
          ),
        );
      });
}
