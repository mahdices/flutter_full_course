import 'package:flutter/material.dart';
import 'package:flutter_full_course/styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChange;
  const AppTextField({super.key, required this.hint, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        border: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        filled: true,
        fillColor: AppColors.fieldColor,
      ),
    );
  }
}
