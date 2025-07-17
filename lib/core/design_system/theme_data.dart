import 'package:flutter/material.dart';

import 'spacings.dart';

part 'app_colors.dart';
part 'color_scheme.dart';

class LightThemeVariation {
  static final _colorScheme = _CustomColorScheme.light;

  ThemeData lightAppThemeData = ThemeData.light().copyWith(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: _colorScheme.surface,
    textTheme: _textTheme(_colorScheme),
    appBarTheme: _appBarTheme(_colorScheme),
    filledButtonTheme: _filledButtonTheme(_colorScheme),
  );
}

class DarkThemeVariation {
  static final _colorScheme = _CustomColorScheme.dark;

  ThemeData darkAppThemeData = ThemeData.dark().copyWith(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: _colorScheme.surface,
    textTheme: _textTheme(_colorScheme),
    appBarTheme: _appBarTheme(_colorScheme),
    filledButtonTheme: _filledButtonTheme(_colorScheme),
  );
}

TextTheme _textTheme(ColorScheme colors) => TextTheme(
  headlineLarge: TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: colors.onSurface,
    height: 44 / 32,
    letterSpacing: 0.8,
  ),
  headlineSmall: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: colors.onSurface,
    height: 32 / 24,
  ),
  // title
  titleLarge: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: colors.onSurface,
    height: 32 / 24,
  ),
  titleMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: colors.onSurface,
    height: 24 / 16,
  ),
  titleSmall: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: colors.onSurface,
    height: 18 / 14,
  ),
  // label
  labelLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
    letterSpacing: 0.2,
    color: colors.onSurface,
  ),
  // Caption
  labelMedium: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    color: colors.onSurfaceVariant,
  ),
  // body
  bodyMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: colors.onSurfaceVariant,
    height: 24 / 16,
  ),
  bodyLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: colors.onSurfaceVariant,
    height: 24 / 16,
  ),
).apply(fontFamily: 'Inter');

AppBarTheme _appBarTheme(ColorScheme colors) => AppBarTheme(
  elevation: 0,
  scrolledUnderElevation: 0,
  backgroundColor: colors.surfaceContainer,
  foregroundColor: colors.primary,
  titleTextStyle: _textTheme(colors).labelLarge,
  titleSpacing: x1,
  centerTitle: false,
);

FilledButtonThemeData _filledButtonTheme(ColorScheme colors) =>
    FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: _textTheme(colors).labelLarge,
        elevation: 0.0,
        fixedSize: null,
        maximumSize: Size.infinite,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(x2)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        animationDuration: kThemeChangeDuration,
        enableFeedback: true,
        alignment: Alignment.center,
      ),
    );
