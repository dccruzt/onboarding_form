import '../choice.dart';

extension ChoiceExt on Choice {
  toBool() {
    return switch (this) {
      Choice.yes => true,
      Choice.no => false,
    };
  }
}
