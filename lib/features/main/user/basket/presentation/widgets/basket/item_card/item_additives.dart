import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/additive_template.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/selected_additives.dart';

class ItemAdditives extends StatelessWidget {
  const ItemAdditives({super.key, required this.additives});

  final List<SelectedAdditives> additives;

  @override
  Widget build(BuildContext context) {
    final ItemCardLogic itemCardController = Get.find();

    return Column(
      children: [
        addVerticalSpace(context.heightByValue(12)),
        Divider(color: neutral50, thickness: 1.h),
        addVerticalSpace(context.heightByValue(12)),
        ...List.generate(additives.length, (index) {
          return AdditiveTemplate(
            title: itemCardController
                .getTitleForLanguage(additives[index].additives),
            price: additives[index].additives.price,
          );
        })
      ],
    );
  }
}
