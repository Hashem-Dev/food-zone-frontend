import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void getView(Widget view) => Get.to(() {
      return view;
    }, preventDuplicates: true);
