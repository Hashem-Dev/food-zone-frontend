import 'package:food_zone/core/services/google_authentication.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authLogout = FGoogleAuthentication();
    final UserLogic userController = Get.find();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary50,
        visualDensity: VisualDensity.comfortable,
        minimumSize: Size(context.width, context.heightByValue(53)),
        iconColor: primary400,
        elevation: 0,
      ),
      onPressed: () async {
        await userController.logout();
        await authLogout.logout();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(SolarIconsOutline.logout_3, size: 22.sp),
          addHorizontalSpace(context.widthByValue(10)),
          Text(
            'Logout',
            style: TextStyle(
              color: primary500,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
