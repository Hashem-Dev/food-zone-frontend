import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/pages/select_location_view.dart';

class LocationDropDown extends StatelessWidget {
  const LocationDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Get.to(() => const SelectLocationView()),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Obx(() {
              final location =
                  preferencesController.deliveryLocation['address'];
              return Text(
                location ?? context.translate.select_your_location,
                style: context.textStyle.displayMedium!
                    .copyWith(fontSize: !context.isPhone ? 9.sp : 18.sp),
              );
            }),
            const Icon(SolarIconsBold.altArrowDown, color: primary700),
          ],
        ),
      ),
    );
  }
}
