import 'package:food_zone/exports.dart';

/// A widget that displays a loading indicator centered on the screen.
///
/// This widget is typically used to indicate that a page or a section of the app
/// is in the process of loading data or performing a task. It overlays the current
/// content with a semi-transparent background and a loading spinner.
class PageLoading extends StatelessWidget {
  const PageLoading({super.key});

  @override

  /// Builds the widget tree for the loading indicator.
  ///
  /// This method returns a [Container] widget with a semi-transparent background
  /// and a centered [LoadingIndicator] widget. The background color is derived
  /// from the current theme's background color with an alpha value of 0.7.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Widget] tree representing the loading indicator overlay.
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.background.withValues(alpha: .7),
      ),
      child: const Center(
        child: LoadingIndicator(),
      ),
    );
  }
}
