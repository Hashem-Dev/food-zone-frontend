import 'package:food_zone/exports.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.userAvatar});

  final String userAvatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w * 0.12214,
      height: context.w * 0.12214,
      child: Image.asset(userAvatar, fit: BoxFit.cover),
    );
  }
}
