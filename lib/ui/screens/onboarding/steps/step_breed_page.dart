import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/design_system/components/regular_dropdown_button.dart';
import '../../../../common/design_system/images/asset_names.dart';
import '../../../../common/design_system/spacings.dart';
import '../../../../domain/entities/breed.dart';
import '../../../controller/onboarding/onboarding_controller.dart';
import '../../../controller/onboarding/steps/step_breed_controller.dart';
import '../../../widgets/form_body.dart';

class StepBreedPage extends StatelessWidget {
  const StepBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          return FormBody(
            header: Image.asset(AssetNames.search, width: x15, height: x15),
            title: 'What breed is your doggy?',
            body: [
              if (state.breeds.isNotEmpty)
                RegularDropdownButton<Breed>(
                  items: state.breeds,
                  selectedItem:
                      onboardingState.selectedBreed ?? state.breeds.first,
                  labelBuilder: (breed) => breed.name,
                  onTap: onboardingCubit.selectBreed,
                ),
            ],
          );
        },
      ),
    );
  }
}
