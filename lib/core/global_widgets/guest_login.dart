import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/presentation/pages/main_screen.dart';

/// A widget that provides a guest login option through a popup menu.
///
/// This widget displays an icon that, when tapped, shows a popup menu with an option
/// to login as a guest. Selecting this option clears all saved data and navigates
/// the user to the main screen.
class GuestLogin extends StatelessWidget {
  const GuestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: PopupMenuButton(
        color: context.background,
        itemBuilder: (BuildContext context) {
          return <PopupMenuItem>[
            PopupMenuItem(
              onTap: () async {
                await prefs.removeAllSavedData();
                Get.to(() => const MainScreen());
              },
              padding: EdgeInsets.zero,
              child: const Center(
                child: Text('Login as a guest'),
              ),
            ),
          ];
        },
        child: const Icon(SolarIconsOutline.menuDots),
      ),
    );
  }
}
