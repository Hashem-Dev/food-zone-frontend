import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final UserLogic controller = Get.find();
      return Text(
        controller.user.name.en,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: primary500,
        ),
      );
    });
  }
}
