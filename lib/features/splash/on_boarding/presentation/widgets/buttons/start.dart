import 'dart:math';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/presentation/pages/register.dart';

class CardStart extends StatelessWidget {
  const CardStart({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) => CustomPaint(
        painter: BorderPainter(currentState: value),
        child: Container(
          width: 94.w,
          height: 94.w,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Container(
            width: 62.w,
            height: 62.h,
            decoration: const BoxDecoration(
              color: primaryWhite,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Get.offAll(() => const RegisterView()),
              icon: const Icon(Icons.arrow_forward_rounded),
              color: primary900,
            ),
          ),
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  final double currentState;

  BorderPainter({required this.currentState});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 2;
    Rect rect = const Offset(0, 0) & Size(size.width, size.height);

    var paint = Paint()
      ..color = primaryWhite
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startAngle = -pi / 2;
    double sweepAmount = currentState * pi * 2;

    canvas.drawArc(rect, startAngle, sweepAmount, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
