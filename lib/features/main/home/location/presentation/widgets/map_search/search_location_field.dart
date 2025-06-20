import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';

class SearchLocationField extends StatelessWidget {
  const SearchLocationField({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationLogic locationLogic = Get.find();

    return ContainerWithShadow(
      child: Obx(() {
        return TextFormField(
          decoration: InputDecoration(
            hintText: context.translate.search,
            prefixIcon: Icon(
              SolarIconsOutline.magnifier,
              color: neutral100,
              size: 22.sp,
            ),
            suffixIcon: locationLogic.showClearButton
                ? IconButton(
                    onPressed: () {
                      locationLogic.clearResultSearch();
                      locationLogic.showClearButton = false;
                    },
                    icon: Icon(
                      SolarIconsOutline.closeCircle,
                      color: neutral100,
                      size: 22.sp,
                    ),
                  )
                : null,
          ),
          controller: locationLogic.searchController,
          focusNode: locationLogic.searchFocusNode,
          onTapOutside: (e) {
            FocusScope.of(context).unfocus();
            if (locationLogic.userLocationText.text.isNotEmpty) {
              locationLogic.changeBottomSheetView = true;
            } else if (locationLogic.locationsResult.isEmpty) {
              locationLogic.clearResultSearch();
            }
          },
          onTap: () {
            locationLogic.changeBottomSheetView = false;
            locationLogic.showSelectedLocation = false;
          },
          onChanged: (input) {
            locationLogic.changeBottomSheetView = false;
            if (input.isEmpty) {
              return;
            }
            locationLogic.searchForLocation();
            locationLogic.showClearButton = true;
          },
          onFieldSubmitted: (input) {
            if (input.isEmpty) {
              return;
            }
            locationLogic.searchForLocation();
          },
          onSaved: (input) {
            if (input != null) {
              locationLogic.searchForLocation();
            }
          },
        );
      }),
    );
  }
}
