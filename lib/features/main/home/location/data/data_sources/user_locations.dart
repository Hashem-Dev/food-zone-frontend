import 'dart:ui';

import 'package:food_zone/features/main/home/location/data/models/location_response.dart';

/// A class that represents user locations data.
///
/// This class holds the user's location data, a callback to re-fetch the data,
/// and a loading state to indicate if the data is currently being fetched.
class UserLocations {
  /// The user's location data.
  ///
  /// This is an instance of [LocationResponse] which contains the location details.
  /// It can be null if the location data is not available.
  final LocationResponse? locations;

  /// A callback function to re-fetch the user's location data.
  ///
  /// This is a [VoidCallback] which is a function that takes no arguments and returns no value.
  final VoidCallback reFetch;

  /// A boolean value indicating if the location data is currently being fetched.
  ///
  /// This is true if the data is being fetched, and false otherwise.
  final bool loading;

  /// Creates a new instance of [UserLocations].
  ///
  /// @param locations The user's location data.
  /// @param reFetch A callback function to re-fetch the user's location data.
  /// @param loading A boolean value indicating if the location data is currently being fetched.
  UserLocations({
    required this.locations,
    required this.reFetch,
    required this.loading,
  });
}
