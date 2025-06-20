import 'package:food_zone/exports.dart';
import 'package:food_zone/features/app/about_app/presentation/pages/about_app_view.dart';
import 'package:food_zone/features/app/terms_of_service/presentation/pages/privacy_policy.dart';
import 'package:food_zone/features/app/terms_of_service/presentation/pages/terms_of_services.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/auto_update.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/dark_mode_switch.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/language_drop_down.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/logout_button.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/push_notification_switch.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/settings/tabs.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/sound_switch.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/user_info/edit_profile_button.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/user_info/profile_avatar.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/user_information.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
 
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserLogic());
    final token = prefs.refreshToken;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: const GradientAppbarTitle(title: 'Profile')),
      body: Obx(() {
        final loading = userController.loading;
        return ResponsiveLayout(
          portrait: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  token.isEmpty
                      ? const AppRedirect()
                      : SizedBox(
                          width: context.width,
                          height: context.heightByValue(65),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ProfileAvatar(),
                              Spacer(),
                              UserInformation(),
                              Spacer(flex: 5),
                              EditProfileButton()
                            ],
                          ),
                        ),
                  const Spacer(),
                  if (token.isNotEmpty) const LogoutButton(),
                  Expanded(
                    flex: 28,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        addVerticalSpace(context.heightByValue(15)),
                        const ProfileTabs(),
                        const Divider(color: neutral50),
                        const LanguageDropDown(),
                        const ThemeModeDropDown(),
                        const PushNotificationSwitch(),
                        const SoundSwitch(),
                        const AutoUpdateSwitch(),
                        const CustomTile(
                          page: TermsOfServices(),
                          title: 'Terms Of Services',
                        ),
                        const CustomTile(
                          page: PrivacyPolicy(),
                          title: 'Privacy Policy',
                        ),
                        const CustomTile(
                          page: AboutAppView(),
                          title: 'About App',
                        ),
                        addVerticalSpace(context.heightByValue(165))
                      ],
                    ),
                  ),
                ],
              ),
              if (loading) const Positioned.fill(child: PageLoading())
            ],
          ),
        );
      }),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.page, required this.title});

  final Widget page;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => page),
      title: Text(
        title,
        style: context.textStyle.displaySmall!.copyWith(fontSize: 16.sp),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: context.textStyle.displaySmall!.color,
      ),
    );
  }
}
