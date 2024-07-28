import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class DashBoardBodyInputField extends StatelessWidget {
  final TextEditingController videoLinkController;
  final GlobalKey<FormState> formKey;
  const DashBoardBodyInputField({
    super.key,
    required this.videoLinkController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: videoLinkController,
        keyboardType: TextInputType.url,
        validator: (String? value) {
          if (value!.isEmpty) return AppStrings.videoLinkRequired;
          return null;
        },
        decoration: const InputDecoration(
          hintText: AppStrings.inputLinkFieldText,
        ),
      ),
    );
  }
}
