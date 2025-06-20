import 'package:food_zone/exports.dart';

class ItemMoreDetails extends StatelessWidget {
  const ItemMoreDetails({
    super.key,
    required this.quantity,
    required this.category,
  });

  final int quantity;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTextRich('Quantity', quantity.toString()),
        _buildTextRich('Category', category),
      ],
    );
  }

  Text _buildTextRich(String title, String subtitle) {
    return Text.rich(
      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
      TextSpan(
        children: <InlineSpan>[
          TextSpan(text: '$title : '),
          TextSpan(
            text: subtitle,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: primary500,
            ),
          ),
        ],
      ),
    );
  }
}
