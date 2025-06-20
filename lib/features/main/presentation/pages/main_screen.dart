import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/pages/home.dart';
import 'package:food_zone/features/main/notifications/presentation/pages/notifications_view.dart';
import 'package:food_zone/features/main/orders/presentation/pages/orders_view.dart';
import 'package:food_zone/features/main/presentation/manager/button_navigation_bar.dart';
import 'package:food_zone/features/main/presentation/widgets/bottom_navigation_bar.dart';
import 'package:food_zone/features/main/user/liked/presentation/pages/liked.dart';
import 'package:food_zone/features/main/user/profile/presentation/pages/profile_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(ButtonNavigationBarController());

    final List<Widget> screens = [
      const HomeView(),
      const OrdersView(),
      const LikedView(),
      const NotificationsView(),
      const ProfileView(),
    ];
    return Obx(() {
      return PopScope(
        onPopInvokedWithResult: (bool pop, f) {
          navigationController.handleBackPress();
        },
        canPop: navigationController.navigationHistory.isEmpty,
        child: Scaffold(
          extendBody: true,
          body: IndexedStack(
            sizing: StackFit.passthrough,
            index: navigationController.selected,
            children: screens,
          ),
          bottomNavigationBar: const ButtonNavigationBar(),
        ),
      );
    });
  }
}
