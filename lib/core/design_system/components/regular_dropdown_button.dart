import 'package:flutter/material.dart';

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
    return DropdownMenu<DropdownItem>(
      initialSelection: _dropdownValue,
      onSelected: (DropdownItem? value) {
        setState(() {
          _dropdownValue = value!;
          widget.onTap.call(value);
        });
      },
      dropdownMenuEntries: widget.items
          .map<DropdownMenuEntry<DropdownItem>>(
            (DropdownItem value) => DropdownMenuEntry<DropdownItem>(
              value: value,
              label: value.name,
            ),
          )
          .toList(),
    );
  }
}

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
  int get hashCode => id.hashCode ^ name.hashCode;
}
