import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';

class ReviewTextField extends HookWidget {
  const ReviewTextField({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final OrderDetailsLogic orderDetailsLogic = Get.find();
    
    return TextFormField(
      controller: orderDetailsLogic.reviewTextControllers[index],
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        disabledBorder: InputBorder.none,
        hintText: 'Type Your Review...',
        focusColor: Colors.transparent,
        hintStyle: TextStyle(
          color: context.isDarkMode
              ? neutral100.withValues(alpha: .3)
              : neutral900.withValues(alpha: .3),
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
