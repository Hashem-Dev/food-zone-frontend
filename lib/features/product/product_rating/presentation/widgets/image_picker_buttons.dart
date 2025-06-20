import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/product_rating/presentation/manager/image_picker_rating.dart';

class ImagePickerButtons extends StatelessWidget {
  const ImagePickerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final pickerController = Get.find<ImagePickerRatingController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => pickerController.pickImageFromCamera(),
          child: const Icon(SolarIconsOutline.camera, color: neutral100),
        ),
        addHorizontalSpace(10),
        GestureDetector(
          onTap: () => pickerController.pickImageFromGallery(),
          child: const Icon(SolarIconsBold.gallery, color: neutral100),
        ),
      ],
    );
  }
}
