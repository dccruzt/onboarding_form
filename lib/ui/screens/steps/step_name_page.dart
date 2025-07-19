import 'package:flutter/material.dart';

import '../../../core/design_system/spacings.dart';
import '../../../domain/entities/breed.dart';

class StepNamePage extends StatefulWidget {
  const StepNamePage({super.key, required this.breed});

  final Breed? breed;

  @override
  State<StepNamePage> createState() => _StepNamePageState();
}

class _StepNamePageState extends State<StepNamePage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _focusNode.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = widget.breed?.name ?? 'pet';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'What is the name of your $label?',
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: x4),
        TextField(
          focusNode: _focusNode,
          controller: _controller,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
        ),
      ],
    );
  }
}
