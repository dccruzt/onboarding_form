part of '../theme_data.dart';

DropdownMenuThemeData _dropdownMenuTheme(ColorScheme colorScheme) =>
    DropdownMenuThemeData(
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      textStyle: _textTheme(
        colorScheme,
      ).bodyLarge?.copyWith(color: colorScheme.onSurface),
    );
