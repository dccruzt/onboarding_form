import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/design_system/components/regular_dropdown_button.dart';
import '../../../core/design_system/spacings.dart';
import '../../../domain/entities/breed.dart';
import '../../controller/onboarding/onboarding_controller.dart';
import '../../controller/onboarding/steps/step_breed_controller.dart';

class StepBreedPage extends StatelessWidget {
  const StepBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StepBreedCubitProvider(
      child: BlocBuilder<StepBreedCubit, StepBreedState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What breed is your doggy?',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: x4),
              if (state.breeds.isNotEmpty)
                RegularDropdownButton<Breed>(
                  items: state.breeds,
                  selectedItem: state.breeds.first,
                  labelBuilder: (breed) => breed.name,
                  onTap: OnboardingCubitProvider.of(context).selectBreed,
                ),
            ],
          );
        },
      ),
    );
  }
}
