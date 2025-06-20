import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/presentation/pages/email.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/manager/edit_profile.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/add_avatar_button.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/user_avatar.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/user_date.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/user_email_field.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/user_gender.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/user_name_field.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/user_phone.dart';

class ProfileEditingView extends StatelessWidget {
  const ProfileEditingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: PopupMenuButton(
              color: context.background,
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    Get.to(() => const EmailView());
                  },
                  height: context.heightByValue(35),
                  child: const Text('Change password'),
                ),
              ],
              child: const Icon(SolarIconsOutline.menuDots),
            ),
          ),
        ],
      ),
      body: ResponsiveLayout(
        portrait: LayoutBuilder(builder: (context, constraint) {
          final height = constraint.maxHeight;
          return SizedBox(
            height: height,
            child: Form(
              child: Obx(() {
                final loading = controller.loading;
                return Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: ContainerWithShadow(
                            radius: 100.r,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Stack(
                                children: <Widget>[
                                  const UserAvatar(),
                                  Positioned(
                                    bottom: 0,
                                    right: context.widthByValue(10),
                                    child: const AddAvatarButton(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: context.heightByValue(15),
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                const UserNameField(),
                                const UserEmailField(),
                                const UserDate(),
                                const UserPhone(),
                                const UserGender(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (loading) const Positioned.fill(child: PageLoading())
                  ],
                );
              }),
            ),
          );
        }),
      ),
      bottomNavigationBar: Material(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
          child: FButton(
              title: 'Save',
              onPressed: () async {
                await controller.updateProfileData();
              }),
        ),
      ),
    );
  }
}
