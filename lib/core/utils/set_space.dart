import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Set width space */
SizedBox addHorizontalSpace(double width) {
  return SizedBox(width: 393.w * (width / 393));
}

/* Set height space */
SizedBox addVerticalSpace(double height) {
  return SizedBox(height: 852.h * (height / 852));
}
