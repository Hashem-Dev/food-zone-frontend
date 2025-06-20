import 'package:food_zone/exports.dart';

class AdditiveTemplate extends StatelessWidget {
  const AdditiveTemplate({super.key, required this.title, required this.price});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthByValue(345),
      margin: EdgeInsets.only(bottom: context.heightByValue(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: context.textStyle.displaySmall!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
          Text(
            '\$ $price',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: primary500,
            ),
          ),
        ],
      ),
    );
  }
}
