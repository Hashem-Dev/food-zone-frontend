import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';

class PhotoUploaderButtons extends StatelessWidget {
  const PhotoUploaderButtons(
      {super.key, required this.order, this.forOrder = false});

  final String order;
  final bool forOrder;

  @override
  Widget build(BuildContext context) {
    final OrderDetailsLogic detailsLogic = Get.find();
    return Row(
      spacing: context.widthByValue(10),
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            if (forOrder) {
              await detailsLogic.uploadOrderReviewFromCamera();
              return;
            }
            await detailsLogic.uploadFromCamera(order);
          },
          child: Icon(
            SolarIconsBold.cameraMinimalistic,
            size: 17.sp,
            color: neutral100,
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (forOrder) {
              await detailsLogic.uploadOrderReviewFromGallery();
              return;
            }
            await detailsLogic.uploadFromGallery(order);
          },
          child: Icon(
            SolarIconsBold.gallery,
            color: neutral100,
            size: 17.sp,
          ),
        ),
      ],
    );
  }
}
