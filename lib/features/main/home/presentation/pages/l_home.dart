import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/offers/offers.dart';

class LandscapeHome extends StatelessWidget {
  const LandscapeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(8),
          addVerticalSpace(12),
          const HomeOffers(),
        ],
      ),
    );
  }
}
