part of '../theme_data.dart';

TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
  headlineLarge: TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: colorScheme.onSurface,
    height: 44 / 32,
    letterSpacing: 0.8,
  ),
  headlineSmall: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: colorScheme.onSurface,
    height: 32 / 24,
  ),
  // title
  titleLarge: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: colorScheme.onSurface,
    height: 32 / 24,
  ),
  titleMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: colorScheme.onSurface,
    height: 24 / 16,
  ),
  titleSmall: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: colorScheme.onSurface,
    height: 18 / 14,
  ),
  // label
  labelLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
    letterSpacing: 0.2,
    color: colorScheme.onSurface,
  ),
  // Caption
  labelMedium: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    color: colorScheme.onSurfaceVariant,
  ),
  // body
  bodyMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: colorScheme.onSurfaceVariant,
    height: 24 / 16,
  ),
  bodyLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: colorScheme.onSurfaceVariant,
    height: 24 / 16,
  ),
).apply(fontFamily: 'Inter');
