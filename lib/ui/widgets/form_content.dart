import 'package:flutter/material.dart';

import '../../core/design_system/spacings.dart';

class FormContent extends StatelessWidget {
  const FormContent({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(x3),
      child: Column(children: children),
    );
  }
}
