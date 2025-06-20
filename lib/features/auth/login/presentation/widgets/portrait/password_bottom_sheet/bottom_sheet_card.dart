import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/bottom_sheet.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/password_bottom_sheet/bottom_sheet_leading.dart';

import 'bottom_sheet_edit_button.dart';
import 'bottom_sheet_subtitle.dart';
import 'bottom_sheet_title.dart';

/// A widget that represents a card in the bottom sheet.
///
/// This card displays a title, subtitle, icon, and an optional edit button.
/// It also highlights itself when selected.
///
/// {@tool snippet}
/// Example usage:
/// ```dart
/// BottomSheetCard(
///   title: 'Title',
///   subtitle: 'Subtitle',
///   icon: Icons.email,
///   sendType: 'email',
/// )
/// ```
/// {@end-tool}
class BottomSheetCard extends StatelessWidget {
  /// Creates a [BottomSheetCard].
  ///
  /// The [title], [subtitle], [icon], and [sendType] parameters are required.
  const BottomSheetCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.sendType,
  });

  /// The title of the card.
  final String title;

  /// The subtitle of the card.
  final String subtitle;

  /// The icon displayed in the card.
  final IconData icon;

  /// The type of send action associated with this card.
  final String sendType;

  /// Builds the widget tree for the [BottomSheetCard].
  ///
  /// This method uses the [Get.put] method to retrieve the [BottomSheetController]
  /// and an [Obx] widget to reactively update the UI based on the controller's state.
  ///
  /// @param context The build context.
  /// @returns A [Widget] representing the card.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomSheetController());

    return Obx(
      () {
        final bool isSelected = controller.selectedSendType == sendType;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                      color: isSelected ? primary500 : neutral50, width: 1),
                ),
                child: ListTile(
                  dense: true,
                  splashColor: Colors.transparent,
                  visualDensity: VisualDensity.standard,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () => controller.selectSendType(sendType),
                  leading: BottomSheetLeading(icon: icon),
                  title: BottomSheetTitle(title: title),
                  subtitle: BottomSheetSubtitle(subtitle: subtitle),
                  trailing: isSelected
                      ? const Icon(
                          SolarIconsBold.checkCircle,
                          size: 20,
                          color: green700,
                        ).animate().fadeIn()
                      : null,
                ),
              ),
            ),
            if (isSelected && prefs.userEmail.isNotEmpty)
              BottomSheetEditButton(sendType: sendType)
          ],
        );
      },
    );
  }
}
