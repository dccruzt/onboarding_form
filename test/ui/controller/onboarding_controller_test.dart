import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding_form/domain/entities/breed.dart';
import 'package:onboarding_form/ui/controller/onboarding/onboarding_controller.dart';

void main() {
  group('OnboardingCubit', () {
    late OnboardingCubit cubit;

    setUp(() {
      cubit = OnboardingCubit();
    });

    test('initial state is index 0 and submitEnabled true', () {
      expect(cubit.state.index, 0);
      expect(cubit.state.submitEnabled, true);
    });

    test('nextStep increments index', () {
      cubit.nextStep();
      expect(cubit.state.index, 1);

      cubit.nextStep();
      expect(cubit.state.index, 2);
    });

    test('previousStep decrements index', () {
      cubit
        ..nextStep()
        ..previousStep();
      expect(cubit.state.index, 0);
    });

    test('selectBreed updates selectedBreed', () {
      final breed = Breed(id: '1', name: 'Beagle');
      cubit.selectBreed(breed);
      expect(cubit.state.selectedBreed, breed);
    });

    test('onChangeName updates name and validation', () {
      expect(cubit.state.isNameValid, false);

      cubit.onChangeName('Fido');
      expect(cubit.state.name, 'Fido');
      expect(cubit.state.isNameValid, true);
    });

    test('performValidations enables submit only for valid name', () {
      cubit.onChangeName('');
      cubit.nextStep();
      cubit.performValidations();
      expect(cubit.state.submitEnabled, false);

      cubit.onChangeName('Max');
      cubit.performValidations();
      expect(cubit.state.submitEnabled, true);
    });
  });
}
