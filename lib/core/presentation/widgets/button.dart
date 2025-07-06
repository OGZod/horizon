import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.label, this.bgColor, this.textStyle});

  final String label;
  final Color? bgColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: bgColor ?? active),
      child: Text(label, style: textStyle),
    );
  }
}
