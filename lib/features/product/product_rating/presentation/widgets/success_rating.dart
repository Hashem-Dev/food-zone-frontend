import 'package:food_zone/exports.dart';

Future showSuccessProductRating(BuildContext context) async {
  return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isDismissible: true,
      backgroundColor: context.appTheme.scaffoldBackgroundColor,
      isScrollControlled: true,
      builder: (BuildContext context) {
        final width = context.w;
        final isLandscape = width > 600;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: isLandscape ? 320.h : 350.h,
          width: isLandscape ? 200.w : width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                FAssets.clover,
                width: isLandscape ? 80.w : null,
                height: 150.h,
              ),
              Text(
                'Thank you for your awesome review!',
                textAlign: TextAlign.center,
                style: context.textStyle.headlineMedium!
                    .copyWith(fontSize: isLandscape ? 12.sp : 22.sp),
              ),
              Text(
                textAlign: TextAlign.center,
                'Your feedback means a lot to us and helps us keep improving. We can\'t wait to see you again!',
                style: context.textStyle.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: isLandscape ? 6.sp : null,
                ),
              ),
              FButton(
                title: context.translate.bottom_sheet_btn_name,
                onPressed: () {
                  Get.back();
                  Get.back();
                },
              )
            ],
          ),
        );
      });
}
