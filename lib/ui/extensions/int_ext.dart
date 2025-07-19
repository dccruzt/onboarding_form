import '../../domain/entities/step.dart';

extension IntExt on int {
  Step toStep() => switch (this) {
    0 => Step.breed,
    1 => Step.name,
    2 => Step.details,
    3 => Step.birthday,
    4 => Step.weight,
    _ => throw ArgumentError('Invalid step index: $this'),
  };
}
