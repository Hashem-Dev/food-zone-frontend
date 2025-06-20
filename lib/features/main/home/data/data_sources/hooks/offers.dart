import 'dart:ui';

import 'package:food_zone/features/main/home/data/models/offers_response.dart';

/// A hook that manages the state of offers in the application.
///
/// This class is used to handle the loading state, the list of offers,
/// and a callback to re-fetch the offers when needed.
class OffersHook {
  /// A list of offers fetched from the server.
  ///
  /// This list contains instances of [OffersResponse] which hold the details
  /// of each offer. It can be null if the offers are not yet fetched.
  final List<OffersResponse>? offers;

  /// A boolean indicating whether the offers are currently being loaded.
  ///
  /// This is true when the offers are being fetched from the server and false
  /// otherwise.
  final bool loading;

  /// A callback function to re-fetch the offers.
  ///
  /// This function is called when the user wants to refresh the list of offers.
  /// It triggers the fetching process again.
  final VoidCallback reFetch;

  /// Creates an instance of [OffersHook].
  ///
  /// @param offers The list of offers.
  /// @param loading The loading state.
  /// @param reFetch The callback to re-fetch offers.
  OffersHook({
    required this.offers,
    required this.loading,
    required this.reFetch,
  });
}
