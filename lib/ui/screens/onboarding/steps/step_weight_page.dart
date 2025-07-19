import 'package:flutter/material.dart';

import '../../../../common/design_system/extensions/widget_list_ext.dart';

class StepWeightPage extends StatelessWidget {
  const StepWeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Weight Step', style: theme.textTheme.headlineSmall),
      ].withX4Spacer(),
    );
  }
}
