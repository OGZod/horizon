import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/text_styles.dart';

class TableHeaderText extends StatelessWidget {
  const TableHeaderText({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: medium.copyWith(fontSize: 14, color: cardText),
    );
  }
}
