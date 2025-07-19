import 'package:flutter/material.dart';

class RegularDropdownButton<T> extends StatefulWidget {
  const RegularDropdownButton({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.labelBuilder,
    required this.onTap,
  });

  final List<T> items;
  final T selectedItem;
  final String Function(T) labelBuilder;

  final ValueChanged<T> onTap;

  @override
  State<RegularDropdownButton<T>> createState() =>
      _RegularDropdownButtonState<T>();
}

class _RegularDropdownButtonState<T> extends State<RegularDropdownButton<T>> {
  late T _dropdownValue;

  @override
  void initState() {
    super.initState();

    _dropdownValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      initialSelection: _dropdownValue,
      label: Text('Select an option'),
      onSelected: (T? value) {
        if (value == null) return;

        setState(() {
          _dropdownValue = value;
        });

        widget.onTap.call(value);
      },
      dropdownMenuEntries: widget.items
          .map<DropdownMenuEntry<T>>(
            (T item) => DropdownMenuEntry<T>(
              value: item,
              label: widget.labelBuilder(item),
            ),
          )
          .toList(),
    );
  }
}
