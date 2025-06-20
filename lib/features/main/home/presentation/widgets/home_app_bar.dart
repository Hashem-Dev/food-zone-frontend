import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/action_home_appbar.dart';
import 'package:food_zone/features/main/home/presentation/widgets/deliver_text.dart';
import 'package:food_zone/features/main/home/presentation/widgets/location_drop_down.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    leadingWidth: context.w,
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(8),
          const DeliverTextHome(),
          addVerticalSpace(8),
          const LocationDropDown(),
        ],
      ),
    ),
    actions: const [ActionHomeAppbar()],
  );
}
