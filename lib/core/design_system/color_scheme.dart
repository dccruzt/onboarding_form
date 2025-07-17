part of 'theme_data.dart';

class _CustomColorScheme extends ColorScheme {
  const _CustomColorScheme({
    required super.brightness,
    required super.primary,
    required super.onPrimary,
    super.primaryContainer,
    super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    super.secondaryContainer,
    super.onSecondaryContainer,
    super.tertiary,
    super.onTertiary,
    super.tertiaryContainer,
    super.onTertiaryContainer,
    required super.error,
    super.errorContainer,
    required super.onError,
    super.onErrorContainer,
    super.surfaceContainer,
    required super.surface,
    required super.onSurface,
    super.surfaceContainerHighest,
    super.onSurfaceVariant,
    super.outline,
    super.inverseSurface,
    super.inversePrimary,
    super.surfaceTint,
  });

  static _CustomColorScheme light = _CustomColorScheme(
    brightness: Brightness.light,
    // $primary
    primary: _AppColors.yellow.shade600,
    // $primaryBg
    onPrimary: _AppColors.blue.shade50,
    // $primaryActive
    primaryContainer: _AppColors.blue.shade700,
    // $primaryBgActive
    onPrimaryContainer: _AppColors.blue.shade100,
    // $secondary
    secondary: _AppColors.pink,
    // $secondaryBg
    onSecondary: _AppColors.pink.shade50,
    // $secondaryActive
    secondaryContainer: _AppColors.pink.shade700,
    // $secondaryBgActive
    onSecondaryContainer: _AppColors.pink.shade200,
    // $success
    tertiary: _AppColors.green,
    // $successBg
    onTertiary: _AppColors.green.shade50,
    // $successActive
    tertiaryContainer: _AppColors.green.shade700,
    // $successBgActive
    onTertiaryContainer: _AppColors.green.shade100,
    // $error
    error: _AppColors.red.shade500,
    // $errorBg
    onError: _AppColors.red.shade50,
    // $errorActive
    errorContainer: _AppColors.red.shade700,
    // $errorBgActive
    onErrorContainer: _AppColors.red.shade100,
    // $mainBg
    surface: _AppColors.grey,
    // $text
    onSurface: _AppColors.grey.shade900,
    // $surface
    surfaceContainer: Colors.white,
    // $secondaryText,
    onSurfaceVariant: _AppColors.grey.shade600,
    // $containerBg
    surfaceContainerHighest: _AppColors.grey.shade100,
    // disabledBg
    surfaceTint: _AppColors.grey.shade200,
    // $border
    outline: _AppColors.grey.shade600,
    // $inverseText
    inversePrimary: Colors.white,
    // $ disabledText
    inverseSurface: _AppColors.grey.shade400,
  );

  static _CustomColorScheme dark = _CustomColorScheme(
    brightness: Brightness.dark,
    // $primary
    primary: _AppColors.yellow.shade500,
    // $primaryBg
    onPrimary: _AppColors.blue.shade900,
    // $primaryActive
    primaryContainer: _AppColors.blue.shade200,
    // $primaryBgActive
    onPrimaryContainer: _AppColors.blue.shade800,
    // $secondary
    secondary: _AppColors.pink.shade400,
    // $secondaryBg
    onSecondary: _AppColors.pink.shade900,
    // $secondaryActive
    secondaryContainer: _AppColors.pink.shade200,
    // $secondaryBgActive
    onSecondaryContainer: _AppColors.pink.shade800,
    // $success
    tertiary: _AppColors.green.shade400,
    // $successBg
    onTertiary: _AppColors.green.shade900,
    // $successActive
    tertiaryContainer: _AppColors.green.shade200,
    // $successBgActive
    onTertiaryContainer: _AppColors.green.shade800,
    // $error
    error: _AppColors.red.shade400,
    // $errorBg
    onError: _AppColors.red.shade900,
    // $errorActive
    errorContainer: _AppColors.red.shade200,
    // $errorBgActive
    onErrorContainer: _AppColors.pink.shade800,
    // $mainBg
    surface: _AppColors.grey.shade900,
    // $text
    onSurface: Colors.white,
    // $surface
    surfaceContainer: _AppColors.grey.shade800,
    // $secondaryText,
    onSurfaceVariant: _AppColors.grey.shade200,
    // $containerBg
    surfaceContainerHighest: _AppColors.grey.shade700,
    // disabledBg
    surfaceTint: _AppColors.grey.shade600,
    // $border
    outline: _AppColors.grey.shade200,
    // $inverseText
    inversePrimary: _AppColors.grey.shade900,
    // $disabledText
    inverseSurface: _AppColors.grey.shade500,
  );
}
