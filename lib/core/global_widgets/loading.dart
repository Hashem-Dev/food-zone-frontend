import 'package:food_zone/exports.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(FAssets.loadingLottie, width: 80.w));
  }
}
