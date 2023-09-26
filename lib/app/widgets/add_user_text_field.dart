import 'package:flutter/material.dart';
import 'package:sib_torsh_task/app/theme/colors.dart';
import 'package:sib_torsh_task/app/theme/styles.dart';

class AddUserTextField extends StatelessWidget {
  const AddUserTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  final String label;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: SibTorshColor.color3,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: SibTorshColor.color1,
          ),
        ),
        hintStyle: textFieldsHintTextStyle,
        hintText: hint,
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: SibTorshColor.color2,
        label: Text(label),
        labelStyle: textFieldsTextStyle,
      ),
      cursorColor: SibTorshColor.color1,
      controller: controller,
      style: textFieldsTextStyle,
    );
  }
}
