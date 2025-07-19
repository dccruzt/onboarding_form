part of '../theme_data.dart';

FilledButtonThemeData _filledButtonTheme(ColorScheme colorScheme) =>
    FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: _textTheme(colorScheme).labelLarge,
        elevation: 0.0,
        fixedSize: null,
        padding: const EdgeInsets.symmetric(horizontal: x8, vertical: x4),
        maximumSize: Size.infinite,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(x8)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        animationDuration: kThemeChangeDuration,
        enableFeedback: true,
        alignment: Alignment.center,
      ),
    );
