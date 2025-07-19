import 'package:flutter/material.dart';

class StepWeightPage extends StatelessWidget {
  const StepWeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Weight Step', style: theme.textTheme.headlineSmall)],
    );
  }
}
