import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_zone/exports.dart';

class SliderButton extends StatelessWidget {
  const SliderButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      borderRadius: BorderRadius.circular(12.r),
      backgroundColor: color,
      foregroundColor: primaryWhite,
      icon: icon,
      label: label,
      onPressed: (BuildContext context) {
        onTap();
      },
    );
  }
}
