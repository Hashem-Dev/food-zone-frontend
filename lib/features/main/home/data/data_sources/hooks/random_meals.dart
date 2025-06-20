import 'dart:ui';

import 'package:food_zone/features/main/home/data/models/random_meals.dart';

/// A hook that manages the state of random meals data.
///
/// This class is used to fetch and manage the state of random meals
/// in the application. It holds the current state of the random meals,
/// a loading indicator, and a callback to re-fetch the data.
class RandomMealsHook {
  /// The current random meals data.
  ///
  /// This can be `null` if the data has not been fetched yet or if there
  /// was an error during the fetch operation.
  final RandomMeals? randomMeals;

  /// A flag indicating whether the data is currently being loaded.
  ///
  /// This is `true` when a fetch operation is in progress and `false`
  /// otherwise.
  final bool loading;

  /// A callback to re-fetch the random meals data.
  ///
  /// This callback can be used to trigger a new fetch operation to
  /// update the random meals data.
  final VoidCallback reFetch;

  /// Creates a new instance of [RandomMealsHook].
  ///
  /// @param reFetch A callback to re-fetch the random meals data.
  /// @param randomMeals The current random meals data (optional).
  /// @param loading A flag indicating whether the data is currently being loaded.
  RandomMealsHook({
    required this.reFetch,
    this.randomMeals,
    required this.loading,
  });
}
