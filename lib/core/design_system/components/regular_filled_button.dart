import 'package:flutter/material.dart';

class RegularFilledButton extends StatelessWidget {
  const RegularFilledButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.enabled = true,
    this.expanded = false,
  });

  final VoidCallback onPressed;
  final String text;
  final bool enabled;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        minimumSize: ButtonStyleButton.allOrNull(
          Size(expanded ? double.infinity : _minButtonHeight, _minButtonHeight),
        ),
      ),
      onPressed: enabled ? () => onPressed() : null,
      child: Text(text),
    );
  }
}

const double _minButtonHeight = 44.0;
