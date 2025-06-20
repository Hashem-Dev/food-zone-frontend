import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/data/data_sources/user_locations.dart';
import 'package:food_zone/features/main/home/location/data/models/location_response.dart';
import 'package:http/http.dart' as http;

/// Hook to manage user locations.
///
/// This hook fetches user locations from a remote server and stores them in the state.
/// It also provides a method to refetch the locations and a loading state.
UserLocations useUserLocationsHook() {
  /// State to store the user locations.
  final userLocations = useState<LocationResponse?>(null);

  /// State to manage the loading status.
  final loading = useState<bool>(false);

  /// Fetches user locations from the server.
  ///
  /// This function sends a GET request to the server to fetch user locations.
  /// On success, it updates the `userLocations` state and saves the locations
  /// in the preferences. If an error occurs, it logs the error.
  ///
  /// @returns Future<void>
  Future<void> fetchUserLocations() async {
    loading.value = true;
    final Uri url = Uri.parse('$baseUrl/address');
    try {
      final response = await http.get(url, headers: prefs.authHeaders);

      if (response.statusCode == 200) {
        userLocations.value = locationResponseFromJson(response.body);
        List<String> points = [];
        userLocations.value?.result.map((location) {
          points.add(locationCoordsToJson(location.location));
        }).toList();
        loading.value = false;
        prefs.saveUserLocation(points);
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// Effect hook to fetch user locations on component mount.
  ///
  /// This hook runs the `fetchUserLocations` function when the component is first mounted.
  /// It sets the loading state to true before fetching the locations.
  useEffect(() {
    loading.value = true;
    fetchUserLocations();
    return;
  }, []);

  /// Refetches the user locations.
  ///
  /// This function calls the `fetchUserLocations` function to refetch the user locations.
  void reFetch() => fetchUserLocations();

  /// Returns the user locations, refetch function, and loading state.
  ///
  /// @returns UserLocations
  return UserLocations(
    locations: userLocations.value,
    reFetch: reFetch,
    loading: loading.value,
  );
}
