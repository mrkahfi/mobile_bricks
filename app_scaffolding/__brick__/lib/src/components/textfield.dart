// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:zog_ui/zog_ui.dart';

class CommonTextfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;

  final TextInputType inputType;

  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  const CommonTextfield({
    Key? key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.inputType = TextInputType.text,
    this.validator,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 4),
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            )),
        ZeroTextField(
          controller: controller,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          keyboardType: inputType,
          validator: validator,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
        )
      ],
    );
  }
}
