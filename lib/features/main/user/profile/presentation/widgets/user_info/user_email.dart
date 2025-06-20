import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';

class UserEmail extends StatelessWidget {
  const UserEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final UserLogic controller = Get.find();
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            SolarIconsBold.letter,
            color: neutral100,
            size: 14.sp,
          ),
          addHorizontalSpace(5),
          Text(
            controller.user.email,
            style: context.textStyle.displaySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    });
  }
}
