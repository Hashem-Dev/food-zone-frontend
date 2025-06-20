import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map_search/search_loading_shimmer.dart';
import 'package:food_zone/features/main/home/location/presentation/widgets/map_search/search_result_tile.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationLogic locationLogic = Get.find();

    return Obx(() {
      final List result = locationLogic.locationsResult;
      return locationLogic.searchStart
          ? const SearchLoadingShimmer()
          : AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: context.heightByValue(8)),
              duration: const Duration(milliseconds: 600),
              height: result.isEmpty
                  ? context.heightByValue(0)
                  : context.heightByValue(250),
              child: ContainerWithShadow(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: result.map(
                      (location) {
                        final properties = location['properties'];

                        final List coordinates =
                            location['geometry']['coordinates'];
                        final description =
                            '${properties['country']}, ${properties['city'] ?? ''}';
                        final placeId =
                            '${properties['state'] ?? ''}, ${properties['county'] ?? ''}';
                        return SearchResultTile(
                          placeId: placeId,
                          description: description,
                          coordinates: coordinates,
                          country: properties['country'],
                          city:
                              '${properties['city'] ?? ''}, ${properties['state'] ?? ''}',
                          addressName: properties['name'] ?? '',
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            );
    });
  }
}
