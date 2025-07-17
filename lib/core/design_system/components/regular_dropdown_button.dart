import 'package:flutter/material.dart';

class DropdownItem {
  const DropdownItem({required this.id, required this.name});

  final String id;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropdownItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode;
}

class RegularDropdownButton extends StatefulWidget {
  const RegularDropdownButton({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onTap,
  });

  final List<DropdownItem> items;
  final DropdownItem selectedItem;
  final ValueChanged<DropdownItem> onTap;

  @override
  State<RegularDropdownButton> createState() => _RegularDropdownButtonState();
}

class _RegularDropdownButtonState extends State<RegularDropdownButton> {
  late DropdownItem _dropdownValue;

  @override
  void initState() {
    super.initState();

    _dropdownValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownButton<DropdownItem>(
      value: _dropdownValue,
      style: theme.textTheme.bodyLarge,
      underline: Container(height: 2),
      onChanged: (DropdownItem? value) {
        setState(() {
          _dropdownValue = value!;
          widget.onTap.call(value);
        });
      },
      items: widget.items.map<DropdownMenuItem<DropdownItem>>((
        DropdownItem value,
      ) {
        return DropdownMenuItem<DropdownItem>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
