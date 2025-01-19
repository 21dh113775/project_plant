import 'package:flutter/material.dart';
import 'package:project_plant/constants.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextfield({
    Key? key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(
        color: Constants.blackColor,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Constants.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: Constants.primaryColor.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Constants.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        prefixIcon: Icon(
          icon,
          color: Constants.blackColor.withOpacity(.3),
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Constants.blackColor.withOpacity(.5),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
      cursorColor: Constants.primaryColor,
    );
  }
}

class PasswordStrengthIndicator extends StatelessWidget {
  final double strength;

  const PasswordStrengthIndicator({
    Key? key,
    required this.strength,
  }) : super(key: key);

  Color _getColor() {
    if (strength <= 0.3) return Colors.red;
    if (strength <= 0.7) return Colors.orange;
    return Colors.green;
  }

  String _getDescription() {
    if (strength <= 0.3) return 'Weak password';
    if (strength <= 0.7) return 'Medium strength password';
    return 'Strong password';
  }

  IconData _getIcon() {
    if (strength <= 0.3) return Icons.sentiment_dissatisfied;
    if (strength <= 0.7) return Icons.sentiment_neutral;
    return Icons.sentiment_satisfied;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: strength,
          backgroundColor: Colors.grey[200],
          color: _getColor(),
          minHeight: 5,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              _getIcon(),
              color: _getColor(),
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              _getDescription(),
              style: TextStyle(
                color: _getColor(),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
