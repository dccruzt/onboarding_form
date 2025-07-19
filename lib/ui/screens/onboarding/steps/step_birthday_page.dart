import 'package:flutter/material.dart';

class StepBirthdayPage extends StatelessWidget {
  const StepBirthdayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Birthday Step', style: theme.textTheme.headlineSmall)],
    );
  }
}
