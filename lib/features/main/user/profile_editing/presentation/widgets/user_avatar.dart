import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final UserLogic controller = Get.find();
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        width: context.widthByValue(180),
        height: context.widthByValue(180),
        child: OptimizedImageLoader(
          fit: BoxFit.fill,
          imageUrl: controller.user.avatar.url,
          height: 150,
          width: 500,
        ),
      );
    });
  }
}
