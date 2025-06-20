import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/terms_of_services/agree_check_box.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/terms_of_services/agree_text.dart';

/// A widget that displays the terms of services with an agreement checkbox and text.
///
/// This widget is used in the registration process to ensure that the user agrees
/// to the terms of services before proceeding. It consists of a horizontal scrollable
/// row containing an [AgreeCheckBox] and an [AgreeTextWidget].
class TermsOfServicesWidget extends StatelessWidget {
  /// Creates a [TermsOfServicesWidget].
  ///
  /// The [key] parameter is optional and can be used to control the widget's
  /// state in the widget tree.
  const TermsOfServicesWidget({super.key});

  /// Builds the [TermsOfServicesWidget].
  ///
  /// This method returns a [SingleChildScrollView] containing a [Row] with an
  /// [AgreeCheckBox] and an [AgreeTextWidget]. The row is horizontally scrollable.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Widget] representing the terms of services with an agreement checkbox and text.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const AgreeCheckBox(),
          addHorizontalSpace(5),
          const AgreeTextWidget(),
        ],
      ),
    );
  }
}
