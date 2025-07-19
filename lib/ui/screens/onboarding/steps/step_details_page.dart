import 'package:flutter/material.dart';

class StepDetailsPage extends StatelessWidget {
  const StepDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Details Step', style: theme.textTheme.headlineSmall)],
    );
  }
}
