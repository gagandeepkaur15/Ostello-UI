import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';

class TextAndNumberField extends StatefulWidget {
  final TextEditingController mobileNumberController;
  final bool inputPhone;
  final int length;
  final int? maxlength;
  const TextAndNumberField({
    super.key,
    this.inputPhone = true,
    required this.mobileNumberController,
    required this.length,
    this.maxlength,
  });

  @override
  TextAndNumberFieldState createState() => TextAndNumberFieldState();
}

class TextAndNumberFieldState extends State<TextAndNumberField> {
  String selectedCountryCode = 'IN +91';
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.mobileNumberController,
      maxLength: widget.maxlength,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
      keyboardType:
          widget.inputPhone ? TextInputType.phone : TextInputType.name,
      decoration: InputDecoration(
        filled: false,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        prefixIcon: widget.inputPhone
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCountryCodeDropdown(),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              )
            : null,
        suffixIcon: isValid
            ? const Icon(
                Icons.check_circle,
                color: Color(0xFF00C853),
              )
            : null,
      ),
      onChanged: (phone) {
        setState(() {
          isValid = phone.length >= widget.length;
        });
      },
    );
  }

  Widget _buildCountryCodeDropdown() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: DropdownButton<String>(
        value: selectedCountryCode,
        underline: const SizedBox(),
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
          color: AppColors.primaryColor,
          size: 35,
        ),
        items: ['IN +91', 'US +1', 'DU +44', 'AU +61', 'SL +81']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: context.theme.textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.greyText,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedCountryCode = newValue;
            });
          }
        },
      ),
    );
  }
}
