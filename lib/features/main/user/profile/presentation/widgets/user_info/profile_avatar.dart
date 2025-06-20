import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery_actions.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final UserLogic controller = Get.find();
      return Container(
        width: context.widthByValue(65),
        height: context.widthByValue(65),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: CldImageWidget(
          fit: BoxFit.cover,
          publicId: controller.user.avatar.publicId,
          memCacheWidth: context.widthByValue(165).round(),
          memCacheHeight: context.widthByValue(165).round(),
          filterQuality: FilterQuality.high,
          placeholder: (context, string) => const Center(
            child: LoadingIndicator(),
          ),
          errorBuilder: (context, string, ob) {
            return const Center(
              child: Icon(SolarIconsOutline.infoCircle),
            );
          },
          cloudinary: CloudinaryObject.fromCloudName(
            cloudName: cloudinaryName,
          ),
          transformation: Transformation()
            ..delivery(Delivery.format(Format.auto))
            ..delivery(Delivery.quality(Quality.auto()))
            ..resize(
              Resize.fit()
                ..width(context.widthByValue(165).round())
                ..height(context.widthByValue(165).round()),
            ),
        ),
      );
    });
  }
}
