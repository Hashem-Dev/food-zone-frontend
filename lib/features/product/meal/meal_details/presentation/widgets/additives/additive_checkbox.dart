import 'package:food_zone/exports.dart';

class AdditiveCheckbox extends StatelessWidget {
  const AdditiveCheckbox({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        gradient: isSelected
            ? const LinearGradient(
                colors: [primary500, primary400],
              )
            : null,
        border: !isSelected ? Border.all(width: 1, color: neutral100) : null,
      ),
      child: Icon(
        SolarIconsOutline.unread,
        size: 20,
        color: context.background,
      ),
    );
  }
}
