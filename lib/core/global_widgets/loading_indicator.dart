import 'package:food_zone/exports.dart';

/// A widget that displays a circular loading indicator.
///
/// The [LoadingIndicator] widget is used to indicate that a task is in progress.
/// It can optionally display the progress of the task if the [progress] parameter is provided.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.progress});

  /// The progress of the task being performed, represented as a value between 0.0 and 1.0.
  /// If null, the indicator will be indeterminate.
  final double? progress;

  @override
  Widget build(BuildContext context) {
    /// Builds the [LoadingIndicator] widget.
    ///
    /// The [build] method returns a [Center] widget containing a [CircularProgressIndicator].
    /// The [CircularProgressIndicator] displays the progress of the task if [progress] is provided,
    /// otherwise, it shows an indeterminate progress indicator.
    ///
    /// @returns A [Center] widget containing a [CircularProgressIndicator] with the specified progress.
    return Center(
      child: CircularProgressIndicator(
        value: progress,
        color: primary500,
        strokeWidth: 1,
      ),
    );
  }
}
