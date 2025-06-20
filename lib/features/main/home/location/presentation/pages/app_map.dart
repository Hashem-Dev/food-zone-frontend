import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map/location_details_sheet.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map/map_viewer.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map/user_location_button.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map_search/search_location_field.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map_search/search_result_list.dart';

class MapPickerScreen extends StatelessWidget {
  const MapPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationLogic = Get.put(LocationLogic());
    // locationLogic.getUserLocation(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Select Your Location',
          style: context.textStyle.displaySmall!.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Stack(
        children: <Widget>[
          const MapViewer(),
          Positioned.fill(
            child: Obx(() {
              final bottomSheetHidden = locationLogic.isBottomSheetHidden &&
                  !locationLogic.selectLocationButton;
              final selectButtonHidden = !locationLogic.isBottomSheetHidden &&
                  locationLogic.selectLocationButton;
              return SafeArea(
                child: AnimatedOpacity(
                  opacity: locationLogic.areButtonsVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 400),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SearchLocationField(),
                              SearchResultList(),
                              UserLocationButton(),
                            ],
                          ),
                        ),
                      ),
                      if (bottomSheetHidden)
                        const LocationDetailsSheet().animate().slideY(
                              duration: const Duration(milliseconds: 500),
                              begin: 1,
                              end: 0,
                            ),
                      if (selectButtonHidden)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0.h),
                          child: locationLogic.selectFromMapLoading
                              ? const LoadingIndicator()
                              : FButton(
                                  title: 'Select this location',
                                  onPressed: () {
                                    locationLogic.addSelectedLocation();
                                  },
                                ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
