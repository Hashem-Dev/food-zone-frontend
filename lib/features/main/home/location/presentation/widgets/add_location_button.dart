import 'package:food_zone/exports.dart';

class AddLocationButton extends StatelessWidget {
  const AddLocationButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width,
        height: context.heightByValue(56),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.isDarkMode ? neutral700 : primary50,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: context.isDarkMode ? neutral50 : primary500,
              size: 24.sp,
            ),
            addHorizontalSpace(context.widthByValue(10)),
            Text(
              'Add New Location',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: context.isDarkMode ? neutral50 : primary500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
