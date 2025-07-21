import 'package:flutter/material.dart';
import 'package:onboarding_form/common/extensions/string_ext.dart';

class SegmentedToggle<T extends Enum> extends StatelessWidget {
  const SegmentedToggle({
    super.key,
    required this.values,
    required this.selected,
    required this.onChanged,
  });

  final List<T> values;
  final T selected;

  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      segments: values
          .map(
            (item) => ButtonSegment<T>(
              value: item,
              label: Text(item.name.capitalize()),
            ),
          )
          .toList(),
      selected: {selected},
      onSelectionChanged: (newSelection) {
        if (newSelection.isNotEmpty) onChanged(newSelection.first);
      },
      multiSelectionEnabled: false,
      showSelectedIcon: false,
    );
  }
}
