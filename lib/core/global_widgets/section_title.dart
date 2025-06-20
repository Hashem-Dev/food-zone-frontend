import 'package:food_zone/exports.dart';

/// A widget that displays a section title with a "view all" button.
///
/// The [SectionTitle] widget is used to display a title for a section of content
/// along with a button that navigates to a new page when pressed. The button's
/// icon changes direction based on the current language.
class SectionTitle extends StatelessWidget {
  /// Creates a [SectionTitle] widget.
  ///
  /// The [title] and [page] parameters must not be null.
  const SectionTitle({super.key, required this.title, required this.page});

  /// The title text to display.
  final String title;

  /// The page to navigate to when the "view all" button is pressed.
  final Widget page;

  /// Builds the [SectionTitle] widget.
  ///
  /// This method returns a [Row] widget containing the title text and a "view all"
  /// button. The button navigates to the specified [page] when pressed.
  ///
  /// @param context The build context.
  /// @returns A [Row] widget containing the title text and a "view all" button.
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textStyle.titleSmall!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton.icon(
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 2),
            ),
          ),
          iconAlignment: IconAlignment.end,
          onPressed: () => Get.to(() => page),
          icon: Icon(
            context.language == 'en'
                ? SolarIconsOutline.altArrowRight
                : SolarIconsOutline.altArrowLeft,
            size: 16,
            color: primary500,
          ),
          label: Text(
            context.translate.view_all,
            style: TextStyle(color: primary600, fontSize: 16.sp),
          ),
        )
      ],
    );
  }
}
