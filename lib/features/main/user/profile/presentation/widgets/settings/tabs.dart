import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/pages/select_location_view.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Function> functions = [
      () => Get.to(() => const SelectLocationView()),
      () => Get.to(() => const MyPromotionView()),
      () => Get.to(() => const InviteFriendsView()),
      () => Get.to(() => const HelpCenterView()),
    ];

    final List<String> title = [
      'My Locations',
      'My Promotions',
      'Invite Friends',
      'Help Center'
    ];

    final List<IconData> icons = [
      SolarIconsOutline.mapPoint,
      SolarIconsOutline.ticketSale,
      SolarIconsOutline.usersGroupTwoRounded,
      SolarIconsOutline.questionCircle,
    ];
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {
              if (prefs.refreshToken.isEmpty && index < 3) {
                redirectDialog(context);
                return;
              }
              functions[index]();
            },
            title: Text(
              title[index],
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Icon(
              icons[index],
              color: context.textStyle.displaySmall!.color,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: context.textStyle.displaySmall!.color,
            ),
          );
        });
  }
}

class MyPromotionView extends StatelessWidget {
  const MyPromotionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Promotions',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 22.sp,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'You don\'t have any promotions yet !',
          style: context.textStyle.headlineMedium!.copyWith(fontSize: 16.sp),
        ),
      ),
    );
  }
}

class InviteFriendsView extends StatelessWidget {
  const InviteFriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> socialIcons = [
      FAssets.twitter,
      FAssets.facebookS,
      FAssets.messenger,
      FAssets.discord,
      FAssets.skype,
      FAssets.telegram,
      FAssets.weeChat,
      FAssets.whatsApp,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invite Friends',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 22.sp,
          ),
        ),
      ),
      body: Center(
        child: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 46.w),
          crossAxisCount: 4,
          mainAxisSpacing: context.widthByValue(24),
          crossAxisSpacing: context.widthByValue(20),
          shrinkWrap: true,
          children: List.generate(
            socialIcons.length,
            (index) => SvgPicture.asset(
              socialIcons[index],
            ),
          ),
        ),
      ),
    );
  }
}

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help Center',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 22.sp,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Coming Soon!',
          style: context.textStyle.headlineMedium!.copyWith(fontSize: 16.sp),
        ),
      ),
    );
  }
}
