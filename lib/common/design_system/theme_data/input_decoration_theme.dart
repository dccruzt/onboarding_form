part of '../theme_data.dart';

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) =>
    InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(x2),
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(x2),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(x2),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
    );
