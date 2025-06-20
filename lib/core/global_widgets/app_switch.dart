import 'package:food_zone/exports.dart';

/// A custom switch widget that adapts to the platform's design language.
///
/// This widget provides a switch that can be toggled on or off. It uses the
/// platform's adaptive design to match the look and feel of the operating system.
///
/// The switch can be customized with different colors for its active and inactive
/// states. It also supports a callback function that is triggered when the switch
/// is toggled.
class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, this.onChanged, this.value = true});

  /// A callback function that is triggered when the switch is toggled.
  ///
  /// The function receives a boolean value indicating the new state of the switch.
  final Function(bool)? onChanged;

  /// The current value of the switch.
  ///
  /// If true, the switch is in the "on" position. If false, it is in the "off" position.
  final bool value;

  @override
  Widget build(BuildContext context) {
    /// Builds the switch widget.
    ///
    /// This method constructs the switch widget with the specified properties and
    /// returns it. The switch's appearance and behavior are customized based on
    /// the provided values and the current theme of the app.
    ///
    /// @returns A [Switch] widget that adapts to the platform's design language.
    return Switch.adaptive(
        value: value,
        activeColor: primary500,
        inactiveThumbColor: primary500,
        inactiveTrackColor:
            context.isDarkMode ? primaryWhite.withValues(alpha: .1) : neutral50,
        activeTrackColor: primary500,
        trackOutlineColor: const WidgetStatePropertyAll(
          Colors.transparent,
        ),
        thumbColor: const WidgetStatePropertyAll(primaryWhite),
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        });
  }
}
