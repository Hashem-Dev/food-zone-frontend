import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/pages/uploaded_image.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePhotoTile extends StatelessWidget {
  const UpdatePhotoTile({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picked = ImagePicker();
    return ListTile(
      title: Text(
        'Update profile photo',
        style: context.textStyle.displaySmall!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () async {
              final image = await picked.pickImage(source: ImageSource.gallery);
              if (image != null) {
                Get.to(() => UploadedImage(imagePath: image.path));
              }
            },
            child: Icon(
              SolarIconsBold.gallery,
              color: neutral100,
              size: 20.sp,
            ),
          ),
          addHorizontalSpace(10),
          GestureDetector(
            onTap: () async {
              final image = await picked.pickImage(source: ImageSource.camera);
              if (image != null) {
                Get.to(() => UploadedImage(imagePath: image.path));
              }
            },
            child: Icon(
              SolarIconsBold.cameraAdd,
              color: neutral100,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
