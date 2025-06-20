import 'package:food_zone/exports.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary500,
        foregroundColor: primaryWhite,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 53.h,
        child: Center(
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
