import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../di/dependencies.dart';
import '../../../domain/entities/breed.dart';
import '../../../domain/use_cases/load_breeds_use_case.dart';
import 'step_breed_state.dart';

class StepBreedCubitProvider extends BlocProvider<StepBreedCubit> {
  StepBreedCubitProvider({
    super.key,
    super.child,
    Create<StepBreedCubit>? create,
    LoadBreedsUseCase? useCase,
  }) : super(
         create:
             create ??
             (context) => StepBreedCubit(loadBreedsUseCase: di())..init(),
       );

  static StepBreedCubit of(BuildContext context) =>
      BlocProvider.of<StepBreedCubit>(context);
}

class StepBreedCubit extends Cubit<StepBreedState> {
  StepBreedCubit({required this.loadBreedsUseCase})
    : super(const StepBreedState());

  final LoadBreedsUseCase loadBreedsUseCase;

  Future<void> init() async {
    await loadBreedsUseCase
        .call()
        .then((value) => _emit(breeds: value))
        .catchError((error) => _emit(error: error));
  }

  void _emit({List<Breed>? breeds, Object? error}) =>
      emit(state.copyWith(breeds: breeds, error: error));
}
