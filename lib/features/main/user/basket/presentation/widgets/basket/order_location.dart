import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/pages/select_location_view.dart';

class OrderLocation extends StatelessWidget {
  const OrderLocation({
    super.key,
    this.withDetail = false,
    this.orderTitleLocation,
    this.orderLocation,
  });

  final bool withDetail;
  final String? orderTitleLocation;
  final String? orderLocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !withDetail
          ? () {
              Get.to(() => const SelectLocationView());
            }
          : null,
      child: Container(
        height: context.heightByValue(80),
        width: context.widthByValue(345),
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding(16),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: context.isDarkMode ? neutral400 : neutral50,
            width: 1,
          ),
          color: context.isDarkMode ? neutral600 : primaryWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: context.heightByValue(8),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  spacing: context.widthByValue(8),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      SolarIconsBold.mapPoint,
                      color: primary500,
                      size: 20.sp,
                    ),
                    Text(
                      'Deliver to',
                      style: context.textStyle.displaySmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (withDetail)
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        orderTitleLocation ?? '',
                        style: context.textStyle.displaySmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (!withDetail)
                      Obx(() {
                        final String? savedLocation =
                            preferencesController.deliveryLocation['title'];
                        return Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          savedLocation ?? '',
                          style: context.textStyle.displaySmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      })
                  ],
                ),
                if (withDetail)
                  Text(
                    orderLocation ?? 'Select Your Location',
                    style: TextStyle(
                      color: context.textStyle.displaySmall!.color,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (!withDetail)
                  Obx(() {
                    final String? savedLocation =
                        preferencesController.deliveryLocation['address'];
                    return Text(
                      savedLocation ?? 'Select Your Location',
                      style: TextStyle(
                        color: savedLocation != null
                            ? context.textStyle.displaySmall!.color
                            : (context.isDarkMode ? neutral400 : neutral100),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }),
              ],
            ),
            if (!withDetail)
              SizedBox(
                height: context.heightByValue(36),
                width: context.widthByValue(36),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: neutral100,
                  size: 30.r,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
