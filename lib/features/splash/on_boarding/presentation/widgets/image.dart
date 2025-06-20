import 'package:food_zone/exports.dart';

class OnBoardingImage extends StatelessWidget {
  final String image;

  const OnBoardingImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 216.h,
      child: CachedNetworkImage(
        imageUrl: image,
        progressIndicatorBuilder: (context, string, download) =>
            LoadingIndicator(progress: download.progress),
      ),
    );
  }
}
