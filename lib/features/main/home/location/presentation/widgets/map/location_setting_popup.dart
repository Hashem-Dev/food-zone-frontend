import 'package:flutter/cupertino.dart';
import 'package:food_zone/exports.dart';
import 'package:geolocator/geolocator.dart';

class AppLocationSettingPopup extends StatelessWidget {
  const AppLocationSettingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        'Location Permission Required',
        style: TextStyle(fontSize: 14.sp),
      ),
      message: Text(
        'You need to manually grant location access from the device settings.',
        style: TextStyle(fontSize: 16.sp),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          onPressed: () async => await Geolocator.openAppSettings(),
          child: const Text(
            'Open Setting',
            style: TextStyle(color: primary500),
          ),
        ),
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: primary500),
          ),
        ),
      ],
    );
  }
}

class DeviceLocationSettingPopup extends StatelessWidget {
  const DeviceLocationSettingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        'Location Service Disabled',
        style: TextStyle(fontSize: 14.sp),
      ),
      message: Text(
        'You need to turn on location service.',
        style: TextStyle(fontSize: 16.sp),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          onPressed: () async => await Geolocator.openLocationSettings(),
          child: const Text(
            'Open Location Setting',
            style: TextStyle(color: primary500),
          ),
        ),
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: primary500),
          ),
        ),
      ],
    );
  }
}
