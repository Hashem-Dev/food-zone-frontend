import 'package:food_zone/config/styles/action_icon.dart';
import 'package:food_zone/config/styles/appbar.dart';
import 'package:food_zone/config/styles/input_decoration.dart';
import 'package:food_zone/config/styles/text.dart';
import 'package:food_zone/config/styles/tooltip.dart';
import 'package:food_zone/exports.dart';

class FAppTheme {
  FAppTheme._();

  /// Returns the font family based on the provided language.
  ///
  /// @param language The language code (e.g., 'en_US', 'en', 'ar').
  /// @returns The font family name as a string.
  static String getFontFamily(String language) {
    if (language == 'en_US' || language == 'en') {
      return 'SFText';
    } else if (language == 'ar') {
      return 'SFArabic';
    }
    return 'SFText';
  }

  /// Creates and returns the light theme for the app.
  ///
  /// This theme is used to style the app's UI components when the app is in light mode.
  /// It includes settings for colors, fonts, and other UI elements.
  ///
  /// @param language The language code to determine the font family.
  /// @param context The build context to access theme-related properties.
  /// @returns A [ThemeData] object representing the light theme.
  static ThemeData lightTheme(String language, BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary500,
        brightness: Brightness.light,
      ),
      brightness: Brightness.light,
      primaryColorDark: neutral900,
      primaryColorLight: primaryWhite,
      scaffoldBackgroundColor: primaryWhite,
      appBarTheme: appBarThemeLight(context),
      actionIconTheme: actionIconThemeDataLight(),
      fontFamily: getFontFamily(language),
      textTheme: textThemeLight(),
      // The text theme used for styling text in the app.
      inputDecorationTheme: inputDecorationLight(),
      tooltipTheme: tooltipThemeLight(),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 0,
        position: PopupMenuPosition.under,
        menuPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: const BorderSide(width: 1, color: neutral200),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        splashFactory: NoSplash.splashFactory,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
        overlayColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return states.contains(WidgetState.focused)
              ? null
              : Colors.transparent;
        }),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
      ),
      radioTheme: const RadioThemeData(
        fillColor: WidgetStatePropertyAll(neutral100),
        overlayColor: WidgetStatePropertyAll(primary500),
      ),
    );
  }

  /// Creates and returns the dark theme for the app.
  ///
  /// This theme is used to style the app's UI components when the app is in dark mode.
  /// It includes settings for colors, fonts, and other UI elements.
  ///
  /// @param language The language code to determine the font family.
  /// @param context The build context to access theme-related properties.
  /// @returns A [ThemeData] object representing the dark theme.
  static ThemeData darkTheme(String language, BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColorDark: neutral900,
      primaryColorLight: primaryWhite,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary500,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: neutral900,
      fontFamily: getFontFamily(language),
      appBarTheme: appBarThemeDark(context),
      actionIconTheme: actionIconThemeDataDark(),
      textTheme: textThemeDark(),
      // The text theme used for styling text in the app.
      inputDecorationTheme: inputDecorationDark(),
      tooltipTheme: tooltipThemeDark(),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 0,
        position: PopupMenuPosition.under,
        menuPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: const BorderSide(width: 1, color: neutral200),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        splashFactory: NoSplash.splashFactory,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
        overlayColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return states.contains(WidgetState.focused)
              ? null
              : Colors.transparent;
        }),
      ),
      radioTheme: const RadioThemeData(
        fillColor: WidgetStatePropertyAll(neutral100),
        overlayColor: WidgetStatePropertyAll(primary500),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
