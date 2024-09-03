import 'package:flutter/material.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/core/constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.size,
    required this.keyboard,
    required this.textController,
    required this.hint,
    this.maxLines = 1, required this.validator,
  });
  final FormFieldValidator validator;
  final int maxLines;
  final TextEditingController textController;
  final String hint;
  final Size size;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? grey900
            : greyBackground,
        boxShadow: Theme.of(context).brightness == Brightness.dark
            ? boxShadowBlack
            : boxShadowWhite,
            borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: validator,
          maxLines: maxLines,
          keyboardType: keyboard,
          controller: textController,
          decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              disabledBorder: const OutlineInputBorder()),
        ),
      ),
    );
  }
}
