import 'package:flutter/material.dart';

import '../../../../common/design_system/components/segmented_toggle.dart';
import '../../../../domain/entities/choice.dart';
import '../../../../domain/entities/extensions/bool_ext.dart';
import '../../../../domain/entities/extensions/choice_ext.dart';
import '../../../../domain/entities/pet_gender.dart';
import '../../../controller/onboarding/onboarding_controller.dart';
import '../../../widgets/form_body.dart';

class StepDetailsPage extends StatelessWidget {
  const StepDetailsPage({
    super.key,
    required this.gender,
    required this.isSterilized,
    required this.isPregnantOrLactating,
  });

  final PetGender gender;
  final bool isSterilized;
  final bool isPregnantOrLactating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBody(
      title: 'Let us meet your pet!',
      body: [
        SegmentedToggle<PetGender>(
          values: PetGender.values,
          selected: gender,
          onChanged: OnboardingCubitProvider.of(context).selectGender,
        ),
        Text('Is it neutered?', style: theme.textTheme.headlineSmall),
        SegmentedToggle<Choice>(
          values: Choice.values,
          selected: isSterilized.toChoice(),
          onChanged: (choice) => OnboardingCubitProvider.of(
            context,
          ).selectIsSterilized(choice.toBool()),
        ),
        Text(
          'Is it pregnant or nursing?',
          style: theme.textTheme.headlineSmall,
        ),
        SegmentedToggle<Choice>(
          values: Choice.values,
          selected: isPregnantOrLactating.toChoice(),
          onChanged: (choice) => OnboardingCubitProvider.of(
            context,
          ).selectIsPregnantOrLactating(choice.toBool()),
        ),
      ],
    );
  }
}
