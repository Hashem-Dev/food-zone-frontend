import 'package:flutter/material.dart';
import 'package:food_zone/features/main/home/presentation/manager/offers.dart';

import 'package:get/get.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = Get.put(OffersLogic());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('${offers.index}'),
      ),
    );
  }
}
