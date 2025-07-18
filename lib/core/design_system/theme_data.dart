import 'package:flutter/material.dart';

import 'spacings.dart';

part 'app_colors.dart';
part 'color_scheme.dart';
part 'theme_data/app_bar_theme.dart';
part 'theme_data/button_theme.dart';
part 'theme_data/dropdown_theme.dart';
part 'theme_data/input_decoration_theme.dart';
part 'theme_data/text_theme.dart';

class LightThemeVariation {
  static final _colorScheme = _CustomColorScheme.light;

  ThemeData lightAppThemeData = ThemeData.light().copyWith(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: _colorScheme.surface,
    textTheme: _textTheme(_colorScheme),
    appBarTheme: _appBarTheme(_colorScheme),
    filledButtonTheme: _filledButtonTheme(_colorScheme),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: _colorScheme.surfaceContainerHighest,
    ),
    inputDecorationTheme: _inputDecorationTheme(_colorScheme),
    dropdownMenuTheme: _dropdownMenuTheme(_colorScheme),
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
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: _colorScheme.surfaceContainerHighest,
    ),
    inputDecorationTheme: _inputDecorationTheme(_colorScheme),
    dropdownMenuTheme: _dropdownMenuTheme(_colorScheme),
  );
}
