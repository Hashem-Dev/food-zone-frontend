import 'dart:ui';

import 'package:food_zone/features/main/home/data/models/search_response.dart';

/// A hook that manages the state of a search operation.
///
/// This class is used to encapsulate the state and behavior of a search operation,
/// including the search response, loading state, and a callback to re-fetch the data.
class SearchHook {
  /// The response of the search operation.
  ///
  /// This contains the data returned from the search query.
  final SearchResponse searchResponse;

  /// A flag indicating whether the search operation is currently loading.
  ///
  /// This is `true` when the search is in progress and `false` otherwise.
  final bool loading;

  /// A callback function to re-fetch the search data.
  ///
  /// This can be used to trigger a new search operation.
  final VoidCallback reFetch;

  /// Creates a new instance of [SearchHook].
  ///
  /// @param searchResponse The response of the search operation.
  /// @param loading A flag indicating whether the search operation is currently loading.
  /// @param reFetch A callback function to re-fetch the search data.
  SearchHook({
    required this.searchResponse,
    required this.loading,
    required this.reFetch,
  });
}
