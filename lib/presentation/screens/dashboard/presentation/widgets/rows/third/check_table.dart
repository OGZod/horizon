import 'package:flutter/material.dart';
import 'package:horizon/config/theme/text_styles.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/table_header_text.dart';

import '../../../../../../../core/presentation/widgets/custom_checkbox.dart';

class CheckTableWidget extends StatelessWidget {
  const CheckTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Check Table', style: bold.copyWith(fontSize: 24)),
            CustomCard(child: Icon(Icons.more_horiz, size: 18)),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            Expanded(flex: 3, child: TableHeaderText(title: 'NAME')),
            Expanded(flex: 2, child: TableHeaderText(title: 'PROGRESS')),
            Expanded(flex: 2, child: TableHeaderText(title: 'QUANTITY')),
            Expanded(flex: 2, child: TableHeaderText(title: 'DATE')),
          ],
        ),
        SizedBox(height: 24),

        // Table Rows
        _buildTableRow(
          isChecked: false,
          name: 'Horizon UI PRO',
          progress: '17.5%',
          quantity: '2.458',
          date: '24.Jan.2021',
        ),
        SizedBox(height: 20),
        _buildTableRow(
          isChecked: true,
          name: 'Horizon UI Free',
          progress: '10.8%',
          quantity: '1.485',
          date: '12.Jun.2021',
        ),
        SizedBox(height: 20),
        _buildTableRow(
          isChecked: true,
          name: 'Weekly Update',
          progress: '21.3%',
          quantity: '1.024',
          date: '5.Jan.2021',
        ),
        SizedBox(height: 20),
        _buildTableRow(
          isChecked: true,
          name: 'Venus 3D Asset',
          progress: '31.5%',
          quantity: '858',
          date: '7.Mar.2021',
        ),
        SizedBox(height: 20),
        _buildTableRow(
          isChecked: false,
          name: 'Marketplace',
          progress: '12.2%',
          quantity: '258',
          date: '17.Dec.2021',
        ),
      ],
    );
  }

  Widget _buildTableRow({
    required bool isChecked,
    required String name,
    required String progress,
    required String quantity,
    required String date,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              CustomCheckbox(isChecked: isChecked),
              SizedBox(width: 16),
              Flexible(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: bold.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(progress, style: bold.copyWith(fontSize: 14)),
        ),
        Expanded(
          flex: 2,
          child: Text(quantity, style: bold.copyWith(fontSize: 14)),
        ),
        Expanded(
          flex: 2,
          child: Text(date, style: bold.copyWith(fontSize: 14)),
        ),
      ],
    );
  }
}
