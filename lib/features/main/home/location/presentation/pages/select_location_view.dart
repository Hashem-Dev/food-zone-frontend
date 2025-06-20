import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/data/repositories/user_locations_hook.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';
import 'package:food_zone/features/main/home/location/presentation/pages/app_map.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/add_location_button.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/location_appbar.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/location_tile/location_tile_card.dart';

class SelectLocationView extends HookWidget {
  const SelectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final locationLogic = Get.put(LocationLogic());
    final locationsData = useUserLocationsHook();
    final loading = locationsData.loading;

    return Scaffold(
      appBar: locationAppBar(context),
      body: Obx(() {
        if (locationLogic.deleteLoading || locationLogic.setDefaultLoading) {
          return const Loading();
        } else {
          return ResponsiveLayout(
            portrait: Column(
              children: <Widget>[
                Expanded(
                  child: (loading || locationsData.locations == null)
                      ? ShimmerContainer(width: context.width, height: 80)
                      : AppRefreshIndicator(
                          refresh: () async => locationsData.reFetch(),
                          icon: SolarIconsBold.mapPointRotate,
                          child: locationsData.locations!.result.isEmpty
                              ? const Center(child: Text('Empty'))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      locationsData.locations?.result.length,
                                  itemBuilder: (_, index) {
                                    final location =
                                        locationsData.locations?.result[index];
                                    return LocationTileCard(
                                      index: index,
                                      location: location!,
                                    );
                                  }),
                        ),
                ),
                AddLocationButton(
                  onTap: () {
                    Get.to(() {
                      return const MapPickerScreen();
                    })?.then((val) {
                      if (val == true) locationsData.reFetch();
                    });
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
