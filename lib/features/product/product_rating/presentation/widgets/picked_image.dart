import 'dart:io';

import 'package:food_zone/exports.dart';

import 'package:food_zone/features/product/product_rating/presentation/manager/image_picker_rating.dart';

class ReviewPickedImage extends StatelessWidget {
  const ReviewPickedImage({super.key});

  @override
  Widget build(BuildContext context) {
    final pickerController = Get.find<ImagePickerRatingController>();
    return Obx(() {
      final pickedImage = pickerController.pickedImage.value;
      return Badge(
        backgroundColor: Colors.transparent,
        label: GestureDetector(
          onTap: () {
            pickerController.pickedImage.value = null;
          },
          child: (pickedImage != null)
              ? const Icon(SolarIconsBold.closeCircle)
              : null,
        ),
        child: Container(
          width: 80.w,
          height: 40.w,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: (pickedImage != null)
              ? Image.file(
                  File(pickedImage.path),
                  fit: BoxFit.cover,
                ).animate().fadeIn(
                    duration: const Duration(seconds: 1),
                  )
              : null,
        ),
      );
    });
  }
}
