import 'dart:ui';

import 'package:food_zone/features/main/home/data/models/category_response.dart';

/// A hook that manages the state of categories in the application.
///
/// This class is used to encapsulate the state and behavior related to
/// fetching and managing categories. It includes the list of categories,
/// a callback to re-fetch the categories, and a loading state.
class CategoriesHook {
  /// The list of categories fetched from the server.
  ///
  /// This list may be null if the categories have not been fetched yet.
  final List<CategoryResponse>? categories;

  /// A callback function to re-fetch the categories.
  ///
  /// This function is called when the categories need to be refreshed.
  final VoidCallback reFetch;

  /// A boolean indicating whether the categories are currently being loaded.
  ///
  /// This is true when the categories are being fetched from the server,
  /// and false otherwise.
  final bool loading;

  /// Creates a new instance of [CategoriesHook].
  ///
  /// @param categories The list of categories.
  /// @param reFetch The callback function to re-fetch the categories.
  /// @param loading The loading state.
  CategoriesHook({
    required this.categories,
    required this.reFetch,
    required this.loading,
  });
}
