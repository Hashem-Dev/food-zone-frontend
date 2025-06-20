import '../../exports.dart';

/// A widget that loads and displays an image from a network URL.
///
/// This widget uses the [CachedNetworkImage] to load the image and cache it for
/// future use. It also provides a loading indicator while the image is being
/// fetched and an error icon if the image fails to load.
class ImageLoader extends StatelessWidget {
  /// Creates an [ImageLoader] widget.
  ///
  /// The [imageUrl] parameter must not be null and is required to specify the
  /// URL of the image to be loaded.
  const ImageLoader({super.key, required this.imageUrl});

  /// The URL of the image to be loaded.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    /// Builds the widget tree for the [ImageLoader].
    ///
    /// This method returns a [CachedNetworkImage] widget that attempts to load
    /// the image from the provided [imageUrl]. While the image is being loaded,
    /// a [LoadingIndicator] is displayed to show the progress. If the image
    /// fails to load, an error icon is displayed.
    ///
    /// @returns A [CachedNetworkImage] widget that displays the image, a loading
    /// indicator, or an error icon based on the loading state.
    return CachedNetworkImage(
      key: ValueKey(imageUrl),
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, string, progress) {
        return LoadingIndicator(
          progress: progress.progress,
        );
      },
      errorWidget: (context, string, _) {
        return const Icon(SolarIconsOutline.infoCircle);
      },
    );
  }
}
