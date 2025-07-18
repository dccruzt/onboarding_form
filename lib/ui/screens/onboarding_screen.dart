import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/design_system/components/regular_filled_button.dart';
import '../controller/onboarding/onboarding_controller.dart';
import '../controller/onboarding/onboarding_state.dart';
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

  void _onCubitStepChanged(int step) {
    _controller.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: OnboardingCubitProvider(
          child: BlocConsumer<OnboardingCubit, OnboardingState>(
            listener: (context, state) => _onCubitStepChanged(state.step),
            builder: (context, state) {
              final progress = (state.step + 1) / OnboardingCubit.totalSteps;

              return Column(
                children: [
                  LinearProgressIndicator(value: progress),
                  Flexible(
                    child: PageView(
                      controller: _controller,
                      physics:
                          const NeverScrollableScrollPhysics(), // disable swipe
                      children: const [
                        StepBreedPage(),
                        StepNamePage(),
                        StepDetailsPage(),
                        StepBirthdayPage(),
                        StepWeightPage(),
                      ],
                    ),
                  ),
                  RegularFilledButton(
                    onPressed: () => _onPressed(context),
                    text: 'Continue',
                    expanded: true,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) =>
      OnboardingCubitProvider.of(context).nextStep();
}
