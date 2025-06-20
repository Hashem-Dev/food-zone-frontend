import 'package:food_zone/exports.dart';

class RestaurantAddress extends StatelessWidget {
  const RestaurantAddress({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          SolarIconsOutline.mapPoint,
          color: primary500,
          size: 18.w,
        ),
        addHorizontalSpace(5),
        Expanded(
          child: Text(
            address,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
            style: TextStyle(
              color: primary500,
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
            ),
          ),
        ),
      ],
    );
  }
}
