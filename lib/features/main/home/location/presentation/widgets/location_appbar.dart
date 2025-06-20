import 'package:food_zone/exports.dart';

AppBar locationAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      'Select Location',
      style: context.textStyle.displaySmall!.copyWith(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
