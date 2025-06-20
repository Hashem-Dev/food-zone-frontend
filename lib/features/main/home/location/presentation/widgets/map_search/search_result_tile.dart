import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({
    super.key,
    required this.description,
    required this.placeId,
    required this.coordinates,
    required this.country,
    required this.city,
    required this.addressName,
  });

  final String description;
  final String placeId;
  final List coordinates;
  final String country;
  final String city;
  final String addressName;

  @override
  Widget build(BuildContext context) {
    final LocationLogic locationLogic = Get.find();
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      onTap: () {
        locationLogic.getLocationDetails(coordinates);
        locationLogic.country = country;
        locationLogic.city = city;
        locationLogic.addressName = addressName;
        locationLogic.userLocationText.text = '$country $city $addressName';
        locationLogic.searchFocusNode.unfocus();
        // locationLogic.locationsResult.clear();
      },
      title: Text(
        description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textStyle.displayLarge!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(SolarIconsOutline.mapPointWave, color: primary500),
      subtitle: Text(placeId),
    );
  }
}
