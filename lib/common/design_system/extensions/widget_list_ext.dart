import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../spacings.dart';

extension WidgetListExt on List<Widget> {
  List<Widget> withX2Spacer() => _withSpacer(x2);

  List<Widget> withX3Spacer() => _withSpacer(x3);

  List<Widget> withX4Spacer() => _withSpacer(x4);

  List<Widget> withX5Spacer() => _withSpacer(x5);

  List<Widget> withX6Spacer() => _withSpacer(x6);

  List<Widget> withX7Spacer() => _withSpacer(x7);

  List<Widget> withX8Spacer() => _withSpacer(x8);

  List<Widget> _withSpacer(double size) =>
      withWidgetInBetween(SizedBox(height: size, width: size));

  List<Widget> withWidgetInBetween(Widget inBetweenWidget) {
    final widgetsList = mapIndexed<List<Widget>>((index, widget) {
      return [if ((index > 0) && length > 1) inBetweenWidget, widget];
    }).expand((widget) => widget).toList();

    return widgetsList;
  }
}
