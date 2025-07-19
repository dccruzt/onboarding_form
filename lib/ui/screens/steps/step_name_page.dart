import 'package:flutter/material.dart';

import '../../../core/design_system/spacings.dart';
import '../../../domain/entities/breed.dart';

class StepNamePage extends StatelessWidget {
  const StepNamePage({super.key, required this.breed});

  final Breed? breed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = breed?.name ?? 'pet';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'What is the name of your $label?',
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: x4),
        const TextField(
          autofocus: true,
          textCapitalization: TextCapitalization.words,
        ),
      ],
    );
  }
}
