import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/data/models/location_response.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/location_tile/location_radio.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/location_tile/location_subtitle.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/location_tile/location_title.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/location_tile/slidable_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTileCard extends StatelessWidget {
  const LocationTileCard({
    super.key,
    required this.index,
    required this.location,
  });

  final int index;
  final LocationResult location;

  @override
  Widget build(BuildContext context) {
    final LocationLogic locationLogic = Get.find();
    final locationAddress =
        '${location.country}, ${location.city}, ${location.additionalInfo}';
    return Container(
      width: context.width,
      height: context.heightByValue(81),
      margin: EdgeInsets.only(bottom: context.heightByValue(8)),
      child: Slidable(
        direction: Axis.horizontal,
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SliderButton(
              color: green600,
              icon: SolarIconsBold.eye,
              label: 'View',
              onTap: () async {
                await locationLogic.viewDeliveryAddress(
                  LatLng(
                    location.location.coordinates[0],
                    location.location.coordinates[1],
                  ),
                );
              },
            ),
            SliderButton(
              color: primary600,
              icon: SolarIconsBold.trashBinMinimalistic,
              label: 'Delete',
              onTap: () => showAppAlert(
                context,
                onTap: () async {
                  Get.back();
                  await locationLogic.deleteSpecificAddress(location.id);
                },
                title: 'Delete Location',
                content: 'Confirm delete delivery location?',
                onCancel: () {},
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: context.isDarkMode ? neutral600 : null,
            border: Border.all(
              width: 1,
              color: context.isDarkMode ? neutral600 : neutral50,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LocationTitle(title: location.addressTitle),
                    addVerticalSpace(context.heightByValue(10)),
                    LocationSubtitle(subtitle: locationAddress),
                  ],
                ),
              ),
              LocationRadio(
                defaultAddress: () {
                  return locationLogic.setDefaultLocation(
                    location.id,
                    locationAddress,
                    location.addressTitle,
                    location.location.coordinates[0],
                    location.location.coordinates[1],
                  );
                },
                index: index,
                isDefault: location.defaultAddress,
              )
            ],
          ),
        ),
      ),
    );
  }
}
