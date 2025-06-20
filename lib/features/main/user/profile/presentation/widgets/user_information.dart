import 'package:food_zone/exports.dart';

import 'package:food_zone/features/main/user/profile/presentation/widgets/user_info/user_email.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/user_info/user_name.dart';
import 'package:food_zone/features/main/user/profile/presentation/widgets/user_info/user_phone.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[UserName(), UserPhone(), UserEmail()],
    );
  }
}
