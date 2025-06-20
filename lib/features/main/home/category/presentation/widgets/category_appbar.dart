import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/models/category_response.dart';

/// A widget that displays the title of a category in the app bar.
///
/// This widget includes an icon and a title, which can be displayed in either
/// English or Arabic based on the user's language preference.
///
/// {@tool snippet}
/// This example shows how to use the [CategoryAppbarTitle] widget.
///
/// ```dart
/// CategoryAppbarTitle(
///   icon: 'https://example.com/icon.png',
///   title: CategoryTitle(en: 'Category', ar: 'الفئة'),
/// )
/// ```
/// {@end-tool}
class CategoryAppbarTitle extends StatelessWidget {
  /// Creates a [CategoryAppbarTitle] widget.
  ///
  /// The [icon] and [title] parameters must not be null.
  const CategoryAppbarTitle({
    super.key,
    required this.icon,
    required this.title,
  });

  /// The title of the category.
  final CategoryTitle title;

  /// The URL of the icon to be displayed.
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImage(
          imageUrl: icon,
          width: 24.w,
          height: 24.w,
        ),
        addHorizontalSpace(12),
        Text(
          prefs.userLanguage == 'en' ? title.en : title.ar,
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
