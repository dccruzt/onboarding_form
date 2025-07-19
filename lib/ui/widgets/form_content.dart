import 'package:flutter/material.dart';

import '../../common/design_system/components/regular_filled_button.dart';
import '../../common/design_system/spacings.dart';

class FormContent extends StatelessWidget {
  const FormContent({
    super.key,
    required this.body,
    this.submitEnabled = false,
    this.submitType = SubmitType.next,
    required this.onSubmitPressed,
  });

  final Widget body;
  final bool submitEnabled;
  final SubmitType submitType;

  final VoidCallback onSubmitPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(x3),
      child: Column(
        children: [
          Flexible(child: body),
          RegularFilledButton(
            onPressed: onSubmitPressed,
            text: submitType.isNext ? 'Continue' : 'Submit',
            expanded: true,
            enabled: submitEnabled,
          ),
        ],
      ),
    );
  }
}

enum SubmitType {
  next,
  submit;

  bool get isNext => this == SubmitType.next;

  bool get isSubmit => this == SubmitType.submit;
}
