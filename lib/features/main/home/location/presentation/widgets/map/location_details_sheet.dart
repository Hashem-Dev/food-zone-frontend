import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/discard_button.dart';

class LocationDetailsSheet extends StatelessWidget {
  const LocationDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationLogic locationLogic = Get.find();

    return BottomSheet(
        backgroundColor: context.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
        ),
        showDragHandle: false,
        enableDrag: false,
        onClosing: () {},
        builder: (_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              children: <Widget>[
                addVerticalSpace(10),
                Text(
                  'Your Location',
                  style: context.textStyle.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                addVerticalSpace(5),
                TextFormField(
                  controller: locationLogic.userLocationText,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: context.textStyle.displaySmall!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Your location',
                    suffixIcon: Icon(
                      SolarIconsOutline.mapPoint,
                      color: context.isDarkMode ? neutral50 : neutral900,
                    ),
                  ),
                ),
                addVerticalSpace(12),
                DropdownMenu(
                  width: context.width,
                  inputDecorationTheme:
                      context.appTheme.inputDecorationTheme.copyWith(
                    constraints: BoxConstraints(
                      maxHeight: context.heightByValue(50),
                    ),
                  ),
                  hintText: 'Select location title',
                  controller: locationLogic.userTitleText,
                  onSelected: (value) {
                    if (value != null) {
                      locationLogic.locationTitleValue = value;
                    }
                  },
                  dropdownMenuEntries: [
                    const DropdownMenuEntry(value: 'Home', label: 'Home'),
                    const DropdownMenuEntry(value: 'Company', label: 'Company'),
                    const DropdownMenuEntry(value: 'Work', label: 'Work'),
                    const DropdownMenuEntry(value: 'Caffe', label: 'Caffe'),
                    const DropdownMenuEntry(value: 'Gym', label: 'Gym'),
                    const DropdownMenuEntry(value: 'Park', label: 'Park'),
                    const DropdownMenuEntry(value: 'Shop', label: 'Shop'),
                    const DropdownMenuEntry(
                        value: 'Hospital', label: 'Hospital'),
                  ],
                ),
                addVerticalSpace(12),
                Row(
                  children: [
                    Obx(() {
                      final loading = locationLogic.saveButtonLoading;
                      return Expanded(
                        child: loading
                            ? const LoadingIndicator()
                            : FButton(
                                title: 'Save',
                                onPressed: () {
                                  return locationLogic.saveLocationData();
                                },
                              ),
                      );
                    }),
                    addHorizontalSpace(context.widthByValue(10)),
                    Expanded(
                      child: DiscardButton(onPressed: () {
                        locationLogic.clearSelectedLocation();
                      }),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
