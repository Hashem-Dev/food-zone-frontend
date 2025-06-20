import 'package:food_zone/exports.dart';
import 'package:food_zone/generated/l10n.dart';

extension Fextensions on BuildContext {
  MediaQueryData get media => MediaQuery.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  double get h => screenSize.height;

  double get w => screenSize.width;

  String get language => Localizations.localeOf(this).languageCode;

  ThemeData get appTheme => Theme.of(this);

  /// Retrieves the [TextTheme] from the current [Theme].
  ///
  /// The [TextTheme] defines the default text styles for various text elements
  /// in the app, such as headlines, body text, captions, etc. It is used to
  /// ensure consistent text styling throughout the app.
  ///
  /// @returns The [TextTheme] of the current [Theme].
  TextTheme get textStyle => Theme.of(this).textTheme;

  InputDecorationTheme get borderStyle => appTheme.inputDecorationTheme;

  Color get background => appTheme.scaffoldBackgroundColor;

  S get translate => S.of(this);

  Brightness get brightness => media.platformBrightness;

  double heightByValue(double value) {
    return heightTransformer(dividedBy: (height / value)).h;
  }

  double widthByValue(double value) {
    return widthTransformer(dividedBy: (width / value)).w;
  }

  double horizontalPadding(double value) {
    return widthTransformer(dividedBy: (width / value)).w;
  }

  double verticalPadding(double value) {
    return heightTransformer(dividedBy: (height / value)).h;
  }

  double horizontalMargin(double value) {
    return widthTransformer(dividedBy: (width / value)).w;
  }

  double verticalMargin(double value) {
    return heightTransformer(dividedBy: (height / value)).h;
  }

  bool get isEn => language == 'en';
}
