import 'dart:developer';

import 'package:food_zone/exports.dart';

class PromoCodeSearch extends StatelessWidget {
  const PromoCodeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Promo Code',
          hintStyle: context.appTheme.inputDecorationTheme.hintStyle!
              .copyWith(fontSize: 16.sp),
          suffixIcon: SizedBox(
            width: context.widthByValue(73),
            child: Center(
              widthFactor: 1,
              child: GestureDetector(
                onTap: () => log('Apply Promotion'),
                child: Text(
                  textAlign: TextAlign.center,
                  'Apply',
                  style: TextStyle(
                    color: primary500,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
