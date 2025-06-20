import 'package:flutter/material.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewer extends StatelessWidget {
  const MapViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationLogic locationLogic = Get.find();
    return Obx(() {
      return GoogleMap(
        style: locationLogic.mapStyle,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          locationLogic.googleMapController = controller;
        },
        initialCameraPosition: CameraPosition(
          zoom: 13.5,
          target: locationLogic.centerPosition,
          bearing: 0,
          tilt: 0,
        ),
        onCameraMove: (CameraPosition position) {
          locationLogic.areButtonsVisible = false;
          locationLogic.keepMarkerCenter(position.target);
        },
        onTap: (LatLng latLng) {
          Marker newMarker = Marker(
            markerId: const MarkerId('selected_marker'),
            position: latLng,
          );
          locationLogic.selectedLatLan = latLng;
          locationLogic.addNewMarker(newMarker);
          locationLogic.locationFromMap = true;
        },
        onCameraIdle: () {
          locationLogic.areButtonsVisible = true;
        },
        zoomControlsEnabled: false,
        compassEnabled: false,
        markers: locationLogic.markers,
      );
    });
  }
}
