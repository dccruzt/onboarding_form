part of '../theme_data.dart';

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
  elevation: 0,
  scrolledUnderElevation: 0,
  backgroundColor: colorScheme.surfaceContainer,
  foregroundColor: colorScheme.primary,
  titleTextStyle: _textTheme(colorScheme).labelLarge,
  titleSpacing: x1,
  centerTitle: false,
);
