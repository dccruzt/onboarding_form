import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onboarding_form/di/dependencies.dart';
import 'package:onboarding_form/domain/entities/breed.dart';
import 'package:onboarding_form/domain/use_cases/load_breeds_use_case.dart';
import 'package:onboarding_form/ui/controller/onboarding/steps/step_breed_controller.dart';
import 'package:onboarding_form/ui/screens/onboarding/onboarding_screen.dart';
import 'package:onboarding_form/ui/screens/onboarding/steps/step_breed_page.dart';
import 'package:onboarding_form/ui/screens/onboarding/steps/step_details_page.dart';
import 'package:onboarding_form/ui/screens/onboarding/steps/step_name_page.dart';

class MockLoadBreedsUseCase extends Mock implements LoadBreedsUseCase {}

void main() {
  late MockLoadBreedsUseCase mockLoadBreedsUseCase;

  setUp(() {
    di.reset();
    mockLoadBreedsUseCase = MockLoadBreedsUseCase();

    di.registerFactory<LoadBreedsUseCase>(() => mockLoadBreedsUseCase);
    di.registerFactory(() => StepBreedCubit(loadBreedsUseCase: di()));
  });

  testWidgets('When OnboardingScreen is prompted, it shows the first step'
      'and progress bar gets the right value', (tester) async {
    when(() => mockLoadBreedsUseCase()).thenAnswer((_) async => _breeds);

    await tester.pumpWidget(const MaterialApp(home: OnboardingScreen()));
    await tester.pumpAndSettle();

    final progressFinder = find.byType(LinearProgressIndicator);
    expect(progressFinder, findsOneWidget);

    final progressWidget = tester.widget<LinearProgressIndicator>(
      progressFinder,
    );
    expect(progressWidget.value, closeTo(0.2, 0.01));

    expect(find.byType(StepBreedPage), findsOneWidget);

    final dropdownFinder = find.byType(DropdownMenu<Breed>);
    expect(dropdownFinder, findsOneWidget);

    await tester.tap(dropdownFinder);
    await tester.pumpAndSettle();

    for (final breed in _breeds) {
      expect(find.text(breed.name), findsWidgets);
    }
  });

  testWidgets('When continue button is pressed in OnboardingScreen'
      'Consecutive pages are displayed', (tester) async {
    when(() => mockLoadBreedsUseCase()).thenAnswer((_) async => _breeds);

    await tester.pumpWidget(const MaterialApp(home: OnboardingScreen()));
    await tester.pumpAndSettle();

    expect(find.byType(StepBreedPage), findsOneWidget);

    final submitButton = find.byType(FilledButton);
    expect(submitButton, findsOneWidget);

    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.byType(StepNamePage), findsOneWidget);

    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    const inputName = 'Max';
    await tester.enterText(textField, inputName);
    await tester.pumpAndSettle();

    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.byType(StepDetailsPage), findsOneWidget);
  });
}

const _breeds = [
  Breed(id: '1', name: 'Labrador'),
  Breed(id: '2', name: 'Beagle'),
  Breed(id: '3', name: 'Poodle'),
  Breed(id: '4', name: 'Bulldog'),
  Breed(id: '5', name: 'German Shepherd'),
];
