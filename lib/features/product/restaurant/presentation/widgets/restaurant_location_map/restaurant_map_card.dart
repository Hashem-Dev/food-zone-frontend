import 'package:food_zone/exports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantMapCard extends StatefulWidget {
  const RestaurantMapCard({super.key});

  @override
  State<RestaurantMapCard> createState() => _RestaurantMapCardState();
}

class _RestaurantMapCardState extends State<RestaurantMapCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w,
      height: context.heightByValue(150),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primary500, width: 1),
      ),
      child: const GoogleMap(
        initialCameraPosition: CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(52.3824, 4.8995),
          zoom: 10,
        ),
        mapType: MapType.normal,
        // indoorViewEnabled: true,
        // zoomGesturesEnabled: false,
        // zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
