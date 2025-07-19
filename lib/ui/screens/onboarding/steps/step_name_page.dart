import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/design_system/extensions/widget_list_ext.dart';
import '../../../../common/design_system/spacings.dart';
import '../../../../domain/entities/breed.dart';
import '../../../controller/onboarding/onboarding_controller.dart';

class StepNamePage extends StatefulWidget {
  const StepNamePage({super.key, required this.breed, this.name});

  final Breed? breed;
  final String? name;

  @override
  State<StepNamePage> createState() => _StepNamePageState();
}

class _StepNamePageState extends State<StepNamePage> {
  final _focusNode = FocusNode();
  late final _controller = TextEditingController(text: widget.name);

  @override
  void dispose() {
    super.dispose();

    _focusNode.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = widget.breed?.name ?? 'pet';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/dog_head.svg', width: x20, height: x20),
        Text(
          'What is the name of your $label?',
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        TextField(
          focusNode: _focusNode,
          controller: _controller,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          onChanged: OnboardingCubitProvider.of(context).setName,
        ),
      ].withX4Spacer(),
    );
  }
}
