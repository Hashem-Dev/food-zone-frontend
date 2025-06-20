import 'package:food_zone/exports.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthByValue(75),
      height: context.heightByValue(22),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(width: 1, color: neutral50),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            status.capitalize!,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: orderStatusColor(
                status,
                context.isDarkMode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Color orderStatusColor(String status, bool isDark) {
  if (status == 'pending') {
    return primary500;
  } else if (status == 'paid') {
    return secondary500;
  } else if (status == 'delivered') {
    return green500;
  } else {
    if (isDark) return neutral100;
    return neutral900;
  }
}
