import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/additive_template.dart';

class ItemAdditives extends StatelessWidget {
  const ItemAdditives({super.key, required this.additives});

  final List<Additive> additives;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(color: neutral50, thickness: 1.h),
        ...List.generate(additives.length, (index) {
          final Additive additive = additives[index];
          return AdditiveTemplate(
            title: context.isEn ? additive.title.en : additive.title.ar,
            price: additive.price,
          );
        }),
      ],
    );
  }
}
