import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_form/domain/entities/breed.dart';
import 'package:provider/provider.dart';

class OnboardingCubitProvider extends BlocProvider<OnboardingCubit> {
  OnboardingCubitProvider({
    super.key,
    super.child,
    Create<OnboardingCubit>? create,
  }) : super(create: create ?? (context) => OnboardingCubit());

  static OnboardingCubit of(BuildContext context) =>
      BlocProvider.of<OnboardingCubit>(context);
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  static const int totalSteps = 5;

  void nextStep() {
    if (state.step < totalSteps - 1) {
      _emit(step: state.step + 1);
    }
  }

  void previousStep() {
    if (state.step > 0) {
      _emit(step: state.step - 1);
    }
  }

  void selectBreed(Breed breed) {
    _emit(selectedBreed: breed);
  }

  void _emit({int? step, Breed? selectedBreed, Object? error}) => emit(
    state.copyWith(step: step, selectedBreed: selectedBreed, error: error),
  );
}

class OnboardingState extends Equatable {
  const OnboardingState({this.step = 0, this.selectedBreed, this.error});

  final int step;
  final Breed? selectedBreed;
  final Object? error;

  OnboardingState copyWith({int? step, Breed? selectedBreed, Object? error}) =>
      OnboardingState(
        step: step ?? this.step,
        selectedBreed: selectedBreed ?? this.selectedBreed,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [step, selectedBreed, error];
}
