import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/presentation/manager/button_navigation_bar.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';

class UserNavigationButton extends StatelessWidget {
  const UserNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(ButtonNavigationBarController());

    return Obx(
      () {
        UserLogic userController = Get.put(UserLogic());
        final image = userController.user.avatar.url;

        return SizedBox(
          height: context.widthByValue(70),
          width: context.widthByValue(70),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              if (navigationController.selected == 4)
                AnimatedAlign(
                  alignment: Alignment.bottomCenter,
                  duration: const Duration(seconds: 4),
                  child: Text(
                    textAlign: TextAlign.center,
                    context.translate.profile,
                    style: TextStyle(
                      fontSize: !context.isPhone ? 7.sp : 12.sp,
                      color: primary500,
                      fontWeight: FontWeight.w700,
                    ),
                  ).animate().fadeIn(delay: 250.ms),
                ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                bottom: navigationController.selected == 4
                    ? 25.h
                    : (!context.isPhone ? -10.h : 0.h),
                child: AnimatedContainer(
                  padding: const EdgeInsets.all(4),
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        navigationController.selected == 4 ? primary500 : null,
                  ),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: primaryWhite),
                    ),
                    child: Container(
                      height: context.widthByValue(40),
                      width: context.widthByValue(40),
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: OptimizedImageLoader(
                        fit: BoxFit.fill,
                        imageUrl: image,
                        height: 90,
                        width: 110,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
