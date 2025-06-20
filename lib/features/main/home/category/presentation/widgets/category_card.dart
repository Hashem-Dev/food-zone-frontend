import 'package:food_zone/exports.dart';

/// A widget that displays a category card with an icon and a title.
///
/// The [CategoryCard] widget is used to represent a category in the application.
/// It displays an icon and a title within a card with a shadow effect.
class CategoryCard extends StatelessWidget {
  /// Creates a [CategoryCard] widget.
  ///
  /// The [icon] and [title] parameters must not be null.
  const CategoryCard({super.key, required this.icon, required this.title});

  /// The URL of the icon to be displayed in the category card.
  final String icon;

  /// The title of the category to be displayed in the category card.
  final String title;

  /// Builds the [CategoryCard] widget.
  ///
  /// This method is called whenever the widget is to be rendered.
  /// It returns a [Container] widget with a shadow effect, containing
  /// the icon and title of the category.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Widget] representing the category card.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: ContainerWithShadow(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: icon,
              width: 25.w,
              height: 25.w,
              progressIndicatorBuilder: (context, string, download) {
                return LoadingIndicator(progress: download.progress);
              },
            ),
            FittedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textStyle.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
