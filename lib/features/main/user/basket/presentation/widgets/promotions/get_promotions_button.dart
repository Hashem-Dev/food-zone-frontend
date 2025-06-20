import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/pages/more_promotion.dart';

class GetPromotionsButton extends StatelessWidget {
  const GetPromotionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.heightByValue(12)),
      padding: EdgeInsetsDirectional.fromSTEB(
        context.heightByValue(24),
        0,
        0,
        0,
      ),
      height: context.heightByValue(56),
      width: context.width,
      decoration: BoxDecoration(
        color: context.isDarkMode ? neutral700 : primary50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        onTap: () => Get.to(() => const MorePromotionView()),
        dense: false,
        visualDensity: VisualDensity.comfortable,
        title: Text(
          'Get More Promotions',
          style: TextStyle(
            color: context.isDarkMode ? neutral50 : primary500,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Icon(
          Icons.add,
          color: context.isDarkMode ? neutral50 : primary500,
          size: 24.sp,
        ),
      ),
    );
  }
}
