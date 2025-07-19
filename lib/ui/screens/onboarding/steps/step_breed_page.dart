import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_form/common/design_system/extensions/widget_list_ext.dart';

import '../../../../common/design_system/components/regular_dropdown_button.dart';
import '../../../../common/design_system/spacings.dart';
import '../../../../domain/entities/breed.dart';
import '../../../controller/onboarding/onboarding_controller.dart';
import '../../../controller/onboarding/steps/step_breed_controller.dart';

class StepBreedPage extends StatelessWidget {
  const StepBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingCubit = OnboardingCubitProvider.of(context);
    final onboardingState = onboardingCubit.state;

    return StepBreedCubitProvider(
      child: BlocConsumer<StepBreedCubit, StepBreedState>(
        listener: (context, state) {
          if (state.breeds.isNotEmpty &&
              onboardingState.selectedBreed == null) {
            onboardingCubit.selectBreed(state.breeds.first);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/search.png', width: x15, height: x15),
              Text(
                'What breed is your doggy?',
                style: theme.textTheme.headlineSmall,
              ),
              if (state.breeds.isNotEmpty)
                RegularDropdownButton<Breed>(
                  items: state.breeds,
                  selectedItem:
                      onboardingState.selectedBreed ?? state.breeds.first,
                  labelBuilder: (breed) => breed.name,
                  onTap: onboardingCubit.selectBreed,
                ),
            ].withX4Spacer(),
          );
        },
      ),
    );
  }
}
