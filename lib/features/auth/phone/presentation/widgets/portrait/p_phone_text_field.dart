import 'package:food_zone/exports.dart';

/// A stateless widget that represents a phone number input field.
///
/// This widget is used to input a phone number with a specific format and
/// includes a prefix for the country code and a suffix icon. It adapts its
/// style based on the screen orientation (portrait or landscape).
class PhoneTextField extends StatelessWidget {
  /// Creates a [PhoneTextField] widget.
  const PhoneTextField({super.key});

  /// Builds the widget tree for the [PhoneTextField].
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Column] widget containing a [Text] widget and a [TextFormField] widget.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Displays the label for the phone number input field.
        Text(context.translate.phone_number),
        addVerticalSpace(8),

        /// A text form field for entering the phone number.
        TextFormField(
          textAlign: TextAlign.start,
          cursorColor: primary500,
          keyboardType: TextInputType.phone,
          style: const TextStyle(fontWeight: FontWeight.w700),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            hintText: context.translate.phone_number,
            hintStyle: context.appTheme.inputDecorationTheme.hintStyle!
                .copyWith(fontSize: isLandscape ? 9.sp : null),
            suffixIconConstraints: BoxConstraints(
              minHeight: isLandscape ? 25.h : 40.h,
              minWidth: isLandscape ? 25.w : 40.w,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                FAssets.syrian,
                semanticsLabel: 'Syrian',
              ),
            ),
            prefixIcon: const Icon(SolarIconsOutline.phoneRounded),
            prefixText: '+963 ',
            prefixStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: primary500,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
