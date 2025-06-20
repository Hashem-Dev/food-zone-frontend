import 'package:food_zone/core/global_widgets/section_title.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/pages/offers_view.dart';

class SpecialOffersTitle extends StatelessWidget {
  const SpecialOffersTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionTitle(
      title: context.translate.special_offers,
      page: const OffersView(),
    );
  }
}
