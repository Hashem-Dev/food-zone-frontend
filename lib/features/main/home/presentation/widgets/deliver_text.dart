import 'package:food_zone/exports.dart';

class DeliverTextHome extends StatelessWidget {
  const DeliverTextHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.translate.deliver_to,
          style: context.textStyle.titleSmall!.copyWith(
            fontSize: !context.isPhone ? 7.sp : 16.sp,
          ),
        ),
        Obx(() {
          final title = preferencesController.deliveryLocation['title'] ?? '';
          return Text(
            title.isEmpty ? '' : ' -> $title',
            style: context.textStyle.displaySmall!.copyWith(
              fontSize: !context.isPhone ? 7.sp : 16.sp,
            ),
          );
        }),
      ],
    );
  }
}
