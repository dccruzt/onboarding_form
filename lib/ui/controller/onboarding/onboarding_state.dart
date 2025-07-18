import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  const OnboardingState({this.step = 0, this.error});

  final int step;
  final Object? error;

  OnboardingState copyWith({int? step, Object? error}) =>
      OnboardingState(step: step ?? this.step, error: error ?? this.error);

  @override
  List<Object?> get props => [step, error];
}
