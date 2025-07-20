import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/design_system/images/asset_names.dart';
import '../../../common/design_system/spacings.dart';
import '../../controller/customer_details/customer_details_controller.dart';
import '../../widgets/form_body.dart';
import '../../widgets/form_content.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({super.key, this.address});

  final String? address;

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  late final _nameController = TextEditingController();
  late final _addressController = TextEditingController(text: widget.address);

  late final _nameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  @override
  void dispose() {
    _addressController.dispose();
    _nameController.dispose();

    _addressFocusNode.dispose();
    _nameFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: CustomerDetailsCubitProvider(
          child: BlocConsumer<CustomerDetailsCubit, CustomerDetailsState>(
            listener: (context, state) {
              _addressController.text = state.address ?? '';

              if (state.showDialog) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Important', textAlign: TextAlign.center),
                    content: const Text(
                      textAlign: TextAlign.center,
                      'There was a problem loading your location. Please provide it manually.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );

                context.read<CustomerDetailsCubit>().onDialogShown();
              }
            },
            builder: (context, state) => FormContent(
              body: FormBody(
                header: Image.asset(
                  AssetNames.thumbsUp,
                  width: x15,
                  height: x15,
                ),
                title:
                    'We are almost there! Please provide your name and address',
                body: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Name'),
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    autofocus: true,
                    onChanged: CustomerDetailsCubitProvider.of(
                      context,
                    ).onChangeName,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Address'),
                    controller: _addressController,
                    focusNode: _addressFocusNode,
                    onChanged: CustomerDetailsCubitProvider.of(
                      context,
                    ).onChangeAddress,
                  ),
                ],
              ),
              submitType: SubmitType.submit,
              submitEnabled: state.submitEnabled,
              onSubmitPressed: _onSubmitPressed,
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmitPressed() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
