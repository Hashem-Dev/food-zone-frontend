import 'package:food_zone/features/main/home/data/models/category_response.dart';

/// A hook that manages the state of category data.
///
/// This class is used to hold the list of categories and the loading state
/// while fetching category data from a data source.
class CategoryHook {
  /// A list of category responses.
  ///
  /// This list contains the categories fetched from the data source.
  /// It can be null if the categories have not been fetched yet.
  final List<CategoryResponse>? categories;

  /// A boolean indicating whether the data is currently being loaded.
  ///
  /// This flag is true when the data is being fetched from the data source
  /// and false otherwise.
  final bool loading;

  /// Creates a new instance of [CategoryHook].
  ///
  /// @param categories The list of category responses. It can be null.
  /// @param loading A boolean indicating whether the data is currently being loaded.
  CategoryHook({this.categories, required this.loading});
}
