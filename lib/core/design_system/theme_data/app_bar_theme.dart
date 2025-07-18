part of '../theme_data.dart';

AppBarTheme _appBarTheme(ColorScheme colors) => AppBarTheme(
  elevation: 0,
  scrolledUnderElevation: 0,
  backgroundColor: colors.surfaceContainer,
  foregroundColor: colors.primary,
  titleTextStyle: _textTheme(colors).labelLarge,
  titleSpacing: x1,
  centerTitle: false,
);
