import 'package:flutter/material.dart';

import '../../common/design_system/components/regular_filled_button.dart';
import '../../common/design_system/extensions/widget_list_ext.dart';
import '../../common/design_system/spacings.dart';

class FormContent extends StatelessWidget {
  const FormContent({
    super.key,
    required this.body,
    this.submitEnabled = false,
    required this.onSubmitPressed,
  });

  final Widget body;
  final bool submitEnabled;

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
            text: 'Continue',
            expanded: true,
            enabled: submitEnabled,
          ),
        ].withX4Spacer(),
      ),
    );
  }
}
