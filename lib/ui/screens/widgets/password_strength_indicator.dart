// password_strength_indicator.dart
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: strength,
          backgroundColor: Colors.grey[200],
          color: _getColor(),
          minHeight: 5,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              strength <= 0.3
                  ? 'Weak'
                  : strength <= 0.7
                      ? 'Medium'
                      : 'Strong',
              style: TextStyle(
                color: _getColor(),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
