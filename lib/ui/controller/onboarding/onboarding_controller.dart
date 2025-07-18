import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void _emit({int? step, Object? error}) =>
      emit(state.copyWith(step: step, error: error));
}

class OnboardingState extends Equatable {
  const OnboardingState({this.step = 0, this.error});

  final int step;
  final Object? error;

  OnboardingState copyWith({int? step, Object? error}) =>
      OnboardingState(step: step ?? this.step, error: error ?? this.error);

  @override
  List<Object?> get props => [step, error];
}
