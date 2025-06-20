import 'dart:ui';

import 'package:food_zone/features/main/home/data/models/restaurant.dart';

/// A model class that represents a hook for managing the state of a list of restaurants.
///
/// This class is used to manage the state of a list of restaurants, including
/// the list of restaurants, a callback to re-fetch the list, and a loading state.
class RestaurantHook {
  /// The list of restaurants.
  ///
  /// This list may be null if the restaurants have not been fetched yet.
  final List<Restaurant>? restaurant;

  /// A callback function to re-fetch the list of restaurants.
  ///
  /// This function should be called when the list of restaurants needs to be
  /// refreshed or updated.
  final VoidCallback reFetch;

  /// A boolean value indicating whether the list of restaurants is currently being loaded.
  ///
  /// This value is true if the list of restaurants is being fetched, and false otherwise.
  final bool loading;

  /// Creates a new instance of the [RestaurantHook] class.
  ///
  /// @param restaurant The list of restaurants.
  /// @param reFetch The callback function to re-fetch the list of restaurants.
  /// @param loading The loading state of the list of restaurants.
  RestaurantHook({
    required this.restaurant,
    required this.reFetch,
    required this.loading,
  });
}
