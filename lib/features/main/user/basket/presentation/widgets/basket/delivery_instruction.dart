import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';

class DeliveryInstruction extends StatelessWidget {
  const DeliveryInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemCardLogic cardLogic = Get.find();
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: cardLogic.deliveryInstruction,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        hintText: 'Delivery Instruction',
        suffixIcon: Icon(SolarIconsOutline.notes),
      ),
    );
  }
}
