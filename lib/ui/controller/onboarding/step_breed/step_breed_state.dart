import 'package:equatable/equatable.dart';

import '../../../../domain/entities/breed.dart';

class StepBreedState extends Equatable {
  const StepBreedState({this.breeds = const [], this.error});

  final List<Breed> breeds;
  final Object? error;

  StepBreedState copyWith({List<Breed>? breeds, Object? error}) =>
      StepBreedState(breeds: breeds ?? this.breeds, error: error ?? this.error);

  @override
  List<Object?> get props => [breeds, error];
}
