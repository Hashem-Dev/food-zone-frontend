import 'package:food_zone/exports.dart';

/// A widget that builds different layouts based on the device's orientation.
///
/// The [ResponsiveLayout] widget takes two optional widgets, [portrait] and [landscape],
/// which are displayed based on the device's orientation. If the device is in portrait mode,
/// the [portrait] widget is displayed. If the device is in landscape mode, the [landscape] widget
/// is displayed. If neither widget is provided, default text widgets are shown.
///
/// This widget uses [LayoutBuilder] and [OrientationBuilder] to determine the device's orientation
/// and size constraints, and animates the transition between orientations using [TweenAnimationBuilder].
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.portrait,
    this.landscape,
  });

  final Widget? portrait;
  final Widget? landscape;

  /// Builds the widget tree based on the device's orientation and size constraints.
  ///
  /// This method uses [LayoutBuilder] to get the maximum width and height of the available space,
  /// and [OrientationBuilder] to determine the device's orientation. Depending on the orientation,
  /// it animates the transition and displays either the [portrait] or [landscape] widget.
  ///
  /// @param context The build context.
  /// @returns A widget tree that adapts to the device's orientation and size constraints.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;
            if (context.isPortrait) {
              return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: height),
                  duration: const Duration(milliseconds: 0),
                  curve: Curves.ease,
                  builder: (context, double value, child) {
                    return SizedBox(
                      width: width,
                      height: value,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        child: LayoutBuilder(
                            builder: (context, scrollConstraints) {
                          return Container(
                            height: height,
                            width: width,
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: portrait ??
                                const Center(
                                  child: Text('Portrait Mode'),
                                ),
                          );
                        }),
                      ),
                    );
                  });
            } else if (context.isLandscape) {
              return TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: width),
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                builder: (context, double value, child) {
                  return SizedBox(
                    width: value,
                    height: height,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: LayoutBuilder(
                        builder: (context, scrollConstraints) {
                          return SizedBox(
                            height: height,
                            width: width,
                            child: landscape ??
                                Center(
                                  child: Text(
                                    'Landscape Mode',
                                    style: context.textStyle.titleLarge,
                                  ),
                                ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text('Tablet Mode'),
            );
          },
        );
      },
    );
  }
}
