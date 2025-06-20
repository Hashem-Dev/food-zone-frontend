import 'package:flutter/cupertino.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map/location_setting_popup.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationButton extends StatelessWidget {
  const UserLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationLogic locationLogic = Get.find();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(context.widthByValue(42), context.widthByValue(42)),
        maximumSize: Size(context.widthByValue(42), context.widthByValue(42)),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      onPressed: () async {
        final locationOff = await Permission.location.serviceStatus;
        final isGranted = await Permission.location.isPermanentlyDenied;

        if (context.mounted) {
          if (locationOff.isDisabled) {
            appSnackBar(
              context,
              label: 'Enable',
              contentText: 'Your Location Service is off.',
              onPressed: () => Geolocator.openLocationSettings(),
            );
          } else if (isGranted) {
            showCupertinoModalPopup(
              context: context,
              builder: (_) => const AppLocationSettingPopup(),
            );
          } else {
            locationLogic.animateToUserLocation();
          }
        }
      },
      child: const Icon(SolarIconsBold.gps),
    );
  }
}
