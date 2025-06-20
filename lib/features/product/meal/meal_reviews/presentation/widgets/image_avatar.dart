import 'package:food_zone/exports.dart';

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, string, progress) {
        return LoadingIndicator(progress: progress.progress);
      },
      errorWidget: (context, string, progress) {
        return const Icon(SolarIconsOutline.infoCircle);
      },
    );
  }
}
