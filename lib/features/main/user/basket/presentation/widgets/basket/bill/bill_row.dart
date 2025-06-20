import 'package:food_zone/exports.dart';

class BillRow extends StatelessWidget {
  const BillRow({super.key, required this.title, this.price});

  final String title;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          price == null ? '--' : '\$ $price',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
