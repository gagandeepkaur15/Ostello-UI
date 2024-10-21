import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String helperText;
  final TextEditingController controller;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.helperText,
    required this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          helperText,
          style: context.theme.textTheme.displayMedium!.copyWith(
            color: AppColors.greyText,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
