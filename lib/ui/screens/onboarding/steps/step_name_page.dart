import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/design_system/images/asset_names.dart';
import '../../../../common/design_system/spacings.dart';
import '../../../../domain/entities/breed.dart';
import '../../../controller/onboarding/onboarding_controller.dart';
import '../../../widgets/form_body.dart';

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
    final label = widget.breed?.name ?? 'pet';

    return FormBody(
      header: SvgPicture.asset(AssetNames.dogHead, width: x20, height: x20),
      title: 'What is the name of your $label?',
      body: [
        TextField(
          focusNode: _focusNode,
          controller: _controller,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          onChanged: OnboardingCubitProvider.of(context).setName,
        ),
      ],
    );
  }
}
