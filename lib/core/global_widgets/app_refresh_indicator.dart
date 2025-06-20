import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:food_zone/exports.dart';

/// A custom refresh indicator widget that wraps around a child widget.
///
/// This widget uses a custom refresh indicator to provide a visual indication
/// when a user performs a pull-to-refresh action. The indicator is customizable
/// with an icon and animations.
///
/// @param refresh A callback function that is triggered when a refresh is requested.
/// @param child The widget below this widget in the tree.
/// @param icon The icon to be displayed in the refresh indicator.
class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.refresh,
    required this.child,
    required this.icon,
  });

  final RefreshCallback refresh;
  final Widget child;
  final IconData icon;

  /// Builds the custom refresh indicator widget.
  ///
  /// This method constructs the `CustomMaterialIndicator` with specified durations
  /// and an indicator builder that animates the provided icon. The child widget
  /// is wrapped within this custom indicator.
  ///
  /// @param context The build context.
  /// @returns A widget that wraps the child widget with a custom refresh indicator.
  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      useMaterialContainer: true,
      durations: const RefreshIndicatorDurations(
        settleDuration: Duration(seconds: 1),
        completeDuration: Duration(seconds: 2),
        finalizeDuration: Durations.short4,
      ),
      onRefresh: () async => refresh(),
      indicatorBuilder: (_, __) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(icon, color: primary500)
              .animate(onPlay: (controller) => controller.repeat())
              .fadeIn(duration: 1000.ms)
              .then(curve: Curves.easeInOut)
              .fadeOut(duration: 1000.ms),
        );
      },
      child: child,
    );
  }
}
