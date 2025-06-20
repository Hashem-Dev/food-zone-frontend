import 'package:food_zone/exports.dart';

class RestaurantService extends StatelessWidget {
  const RestaurantService({
    super.key,
    required this.service,
    required this.icon,
    required this.serviceName,
  });

  final bool service;
  final IconData icon;
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: service ? green700 : neutral300,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1, color: green700),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            serviceName,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: primaryWhite,
            ),
          ),
          addHorizontalSpace(5),
          Icon(icon, size: 14.sp, color: primaryWhite),
        ],
      ),
    );
  }
}
