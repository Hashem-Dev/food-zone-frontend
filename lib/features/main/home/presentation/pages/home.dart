import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/pages/l_home.dart';
import 'package:food_zone/features/main/home/presentation/pages/p_home.dart';
import 'package:food_zone/features/main/home/presentation/widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: const ResponsiveLayout(
        portrait: PortraitHomeView(),
        landscape: LandscapeHome(),
      ),
    );
  }
}
