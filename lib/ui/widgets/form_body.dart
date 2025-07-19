import 'package:flutter/material.dart';

import '../../common/design_system/extensions/widget_list_ext.dart';

class FormBody extends StatelessWidget {
  const FormBody({
    super.key,
    this.header,
    required this.title,
    required this.body,
  });

  final Widget? header;
  final String title;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (header != null) header!,
        Text(
          title,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        ...body,
      ].withX4Spacer(),
    );
  }
}
