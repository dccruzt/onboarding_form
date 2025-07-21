import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/breed.dart';
import '../../../domain/entities/pet_gender.dart';
import '../../../domain/entities/step.dart';
import '../../extensions/int_ext.dart';

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
    if (state.index < totalSteps - 1) {
      _emit(index: state.index + 1);
    }
  }

  void previousStep() {
    if (state.index > 0) {
      _emit(index: state.index - 1);
    }
  }

  void selectBreed(Breed breed) {
    _emit(selectedBreed: breed);
  }

  void onChangeName(String name) {
    _emit(name: name);
  }

  void selectGender(PetGender gender) {
    _emit(gender: gender);
  }

  void selectIsNeutered(bool isNeutered) {
    _emit(isNeutered: isNeutered);
  }

  void selectIsPregnantOrNursing(bool isPregnantOrNursing) {
    _emit(isPregnantOrNursing: isPregnantOrNursing);
  }

  void performValidations() {
    switch (state.index.toStep()) {
      case Step.breed:
        _emit(submitEnabled: true);
        break;
      case Step.name:
        _emit(submitEnabled: state.isNameValid);
        break;
      case Step.details:
        _emit(submitEnabled: true);
        break;
      case Step.birthday:
        _emit(submitEnabled: true);
        break;
      case Step.weight:
        _emit(submitEnabled: true);
        break;
    }
  }

  void _emit({
    int? index,
    bool? submitEnabled,
    Breed? selectedBreed,
    String? name,
    PetGender? gender,
    bool? isNeutered,
    bool? isPregnantOrNursing,
    Object? error,
  }) => emit(
    state.copyWith(
      index: index,
      submitEnabled: submitEnabled,
      selectedBreed: selectedBreed,
      name: name,
      gender: gender,
      isNeutered: isNeutered,
      isPregnantOrNursing: isPregnantOrNursing,
      error: error,
    ),
  );
}

class OnboardingState extends Equatable {
  const OnboardingState({
    this.index = 0,
    this.submitEnabled = true,
    this.selectedBreed,
    this.name,
    this.gender = PetGender.male,
    this.isNeutered = false,
    this.isPregnantOrNursing = false,
    this.error,
  });

  final int index;
  final bool submitEnabled;
  final Breed? selectedBreed;
  final String? name;
  final PetGender gender;
  final bool isNeutered;
  final bool isPregnantOrNursing;
  final Object? error;

  bool get isNameValid => name?.trim().isNotEmpty ?? false;

  OnboardingState copyWith({
    int? index,
    bool? submitEnabled,
    Breed? selectedBreed,
    String? name,
    PetGender? gender,
    bool? isNeutered,
    bool? isPregnantOrNursing,
    Object? error,
  }) => OnboardingState(
    index: index ?? this.index,
    submitEnabled: submitEnabled ?? this.submitEnabled,
    selectedBreed: selectedBreed ?? this.selectedBreed,
    name: name ?? this.name,
    gender: gender ?? this.gender,
    isNeutered: isNeutered ?? this.isNeutered,
    isPregnantOrNursing: isPregnantOrNursing ?? this.isPregnantOrNursing,
    error: error ?? this.error,
  );

  @override
  List<Object?> get props => [
    index,
    submitEnabled,
    selectedBreed,
    name,
    gender,
    isNeutered,
    isPregnantOrNursing,
    error,
  ];
}
