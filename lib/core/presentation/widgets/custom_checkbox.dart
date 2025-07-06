import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key, this.isChecked = false,
  });
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isChecked ? active : Colors.transparent,
        border: Border.all(
          color: isChecked ? Color(0xFF8B5CF6) : Theme.of(context).primaryColorLight,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: isChecked
          ? Icon(Icons.check, color: card, size: 18)
          : null,
    );
  }
}
