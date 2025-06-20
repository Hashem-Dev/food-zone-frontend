import 'package:food_zone/exports.dart';

class BlurBackground extends StatelessWidget {
  const BlurBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              neutral800,
              neutral800.withValues(alpha: .3),
              neutral800.withValues(alpha: .1),
            ],
          ),
        ),
      ),
    );
  }
}
