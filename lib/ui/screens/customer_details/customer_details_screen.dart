import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/design_system/extensions/widget_list_ext.dart';
import '../../../common/design_system/spacings.dart';
import '../../controller/customer_details/customer_details_controller.dart';
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
    _addressFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: EdgeInsets.all(x3),
            child: CustomerDetailsCubitProvider(
              child: BlocListener<CustomerDetailsCubit, CustomerDetailsState>(
                listener: (context, state) {
                  _addressController.text = state.address ?? '';
                },
                child: FormContent(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/thumbs_up.png',
                        width: x15,
                        height: x15,
                      ),
                      Text(
                        'We are almost there! Please provide your name and address',
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Name'),
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Address'),
                        controller: _addressController,
                        focusNode: _addressFocusNode,
                        autofocus: true,
                      ),
                    ].withX4Spacer(),
                  ),
                  onSubmitPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
