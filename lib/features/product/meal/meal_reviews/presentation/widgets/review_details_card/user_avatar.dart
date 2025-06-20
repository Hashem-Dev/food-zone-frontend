import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/image_avatar.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.userAvatar});

  final String userAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w * 0.12214,
      height: context.w * 0.12214,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ImageAvatar(image: userAvatar),
    );
  }
}
