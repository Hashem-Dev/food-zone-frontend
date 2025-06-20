import 'package:flutter/material.dart';
import 'package:food_zone/core/utils/set_space.dart';

import 'offers_images.dart';
import 'offers_indicator.dart';

class HomeOffers extends StatelessWidget {
  const HomeOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OffersImages(),
        addVerticalSpace(13),
        const OffersIndicators()
      ],
    );
  }
}
