import 'package:food_zone/exports.dart';

class DiscardButton extends StatelessWidget {
  const DiscardButton({super.key, required this.onPressed, this.background});

  final Function() onPressed;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: background ?? context.background,
        elevation: .8,
        side: const BorderSide(color: primary500, width: .5),
        foregroundColor: primary500,
        disabledBackgroundColor: primary100,
        animationDuration: const Duration(seconds: 5),
      ),
      child: Text(
        'Discard',
        style: TextStyle(
          fontSize: context.isPhone ? 18.sp : 11.sp,
          fontWeight: FontWeight.w500,
          color: primary500,
        ),
      ),
    );
  }
}
