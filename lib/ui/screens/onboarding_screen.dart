import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/design_system/components/regular_filled_button.dart';
import '../../common/design_system/spacings.dart';
import '../controller/onboarding/onboarding_controller.dart';
import '../extensions/int_ext.dart';
import '../widgets/form_content.dart';
import 'steps/step_birthday_page.dart';
import 'steps/step_breed_page.dart';
import 'steps/step_details_page.dart';
import 'steps/step_name_page.dart';
import 'steps/step_weight_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _onCubitStepChanged(BuildContext context, int step) {
    OnboardingCubitProvider.of(context).performValidations();

    _controller.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingCubitProvider(
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) => _onCubitStepChanged(context, state.index),
        builder: (context, state) {
          final progress = (state.index + 1) / OnboardingCubit.totalSteps;

          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () => state.index.toStep().isFirst
                    ? Navigator.of(context).pop()
                    : OnboardingCubitProvider.of(context).previousStep(),
              ),
            ),
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(value: progress),
                  Flexible(
                    child: FormContent(
                      children: [
                        Flexible(
                          child: PageView(
                            controller: _controller,
                            onPageChanged: (index) {
                              if (!index.toStep().isName) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            },
                            physics:
                                const NeverScrollableScrollPhysics(), // disable swipe
                            children: [
                              StepBreedPage(),
                              StepNamePage(
                                breed: state.selectedBreed,
                                name: state.name,
                              ),
                              StepDetailsPage(),
                              StepBirthdayPage(),
                              StepWeightPage(),
                            ],
                          ),
                        ),
                        const SizedBox(height: x3),
                        RegularFilledButton(
                          onPressed: () => _onPressed(context),
                          text: 'Continue',
                          expanded: true,
                          enabled: state.submitButtonEnabled,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onPressed(BuildContext context) =>
      OnboardingCubitProvider.of(context).nextStep();
}
