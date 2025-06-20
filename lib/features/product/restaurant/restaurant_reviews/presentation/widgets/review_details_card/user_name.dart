import 'package:food_zone/exports.dart';

class UserName extends StatelessWidget {
  const UserName({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Text(
      username,
      style: context.textStyle.displaySmall!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
