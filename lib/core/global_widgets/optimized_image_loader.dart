import 'dart:developer';

import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery_actions.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:food_zone/exports.dart';

class OptimizedImageLoader extends StatelessWidget {
  const OptimizedImageLoader({
    super.key,
    required this.imageUrl,
    required this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double height;
  final double? width;
  final BoxFit fit;

  @override

  /// Builds the widget tree for the OptimizedImageLoader.
  ///
  /// This method constructs a [CldImageWidget] that loads an image from a Cloudinary URL,
  /// applies transformations for optimization, and handles placeholder and error states.
  ///
  /// The [CldImageWidget] is configured with the provided [imageUrl], [height], [width], and [fit].
  /// It also adjusts the image dimensions based on the device's pixel ratio for better performance.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Widget] that displays the optimized image with placeholder and error handling.
  ///
  /// The returned [Widget] can be used within a Flutter app to display images efficiently,
  /// ensuring they are optimized for the device's screen and network conditions.
  Widget build(BuildContext context) {
    final deviceRatio = View.of(context).devicePixelRatio;
    return CldImageWidget(
      fit: fit,
      publicId: imageUrl,
      memCacheWidth: (width ?? context.width * deviceRatio).round(),
      memCacheHeight: (context.heightByValue(height) * deviceRatio).round(),
      filterQuality: FilterQuality.high,
      placeholder: (context, string) => const Center(
        child: LoadingIndicator(),
      ),
      errorBuilder: (context, string, ob) {
        log('Error with loading image: $string');
        return const Center(
          child: Icon(SolarIconsOutline.infoCircle),
        );
      },
      cloudinary: CloudinaryObject.fromCloudName(
        cloudName: cloudinaryName,
      ),
      transformation: Transformation()
        ..delivery(Delivery.format(Format.auto))
        ..delivery(Delivery.quality(Quality.auto()))
        ..resize(
          Resize.fit()
            ..width((width ?? context.width * deviceRatio).round())
            ..height((context.heightByValue(height) * deviceRatio).round()),
        ),
    );
  }
}
