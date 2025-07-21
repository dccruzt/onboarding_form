part of '../theme_data.dart';

SegmentedButtonThemeData _segmentedButtonTheme(ColorScheme colorScheme) =>
    SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(_textTheme(colorScheme).labelLarge),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: x8, vertical: x4),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(x8)),
        ),
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(WidgetState.selected)) {
            return BorderSide(color: colorScheme.primary, width: 2);
          }
          return BorderSide(color: colorScheme.outline, width: 1);
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary.withValues(
              alpha: 0.3,
            ); // subtle tint for selected
          }
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        overlayColor: WidgetStateProperty.all(
          colorScheme.primary.withValues(alpha: 0.08),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        animationDuration: kThemeChangeDuration,
        alignment: Alignment.center,
      ),
    );
