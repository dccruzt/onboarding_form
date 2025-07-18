import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/design_system/components/regular_dropdown_button.dart';
import '../../../core/design_system/spacings.dart';
import '../../controller/onboarding/steps/step_breed_controller.dart';
import '../../extensions/breeds_list_ext.dart';

class StepBreedPage extends StatelessWidget {
  const StepBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StepBreedCubitProvider(
      child: BlocBuilder<StepBreedCubit, StepBreedState>(
        builder: (context, state) {
          final list = state.breeds.toDropdownItemList();

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What breed is your doggy?'),
              const SizedBox(height: x2),
              if (state.breeds.isNotEmpty)
                RegularDropdownButton(
                  items: state.breeds.toDropdownItemList(),
                  selectedItem: list.first,
                  onTap: (DropdownItem value) {},
                ),
            ],
          );
        },
      ),
    );
  }
}
