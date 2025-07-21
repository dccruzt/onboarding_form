import '../choice.dart';

extension BoolExt on bool {
  Choice toChoice() {
    return this ? Choice.yes : Choice.no;
  }
}
