import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/config/theme/text_styles.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/table_header_text.dart';

class ComplexTableWidget extends StatelessWidget {
  const ComplexTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(24),
        color: Theme.of(context).cardColor,
      ),
      height: 350,
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Complex Table', style: bold.copyWith(fontSize: 24)),
                CustomCard(child: Icon(Icons.more_horiz, color: white)),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(flex: 3, child: TableHeaderText(title: 'NAME')),
                Expanded(flex: 2, child: TableHeaderText(title: 'STATUS')),
                Expanded(flex: 2, child: TableHeaderText(title: 'DATE')),
                Expanded(flex: 2, child: TableHeaderText(title: 'PROGRESS')),
              ],
            ),
          ),
          Divider(height: 24,),

          _buildTableRow(
            name: 'Horizon UI PRO',
            status: 'Approved',
            statusColor: Color(0xFF10B981),
            statusIcon: Icons.check_circle,
            date: '18 Apr 2022',
            progress: 0.75,
          ),
          SizedBox(height: 20),
          _buildTableRow(
            name: 'Horizon UI Free',
            status: 'Disable',
            statusColor: Color(0xFFEF4444),
            statusIcon: Icons.cancel,
            date: '18 Apr 2022',
            progress: 0.25,
          ),
          SizedBox(height: 20),
          _buildTableRow(
            name: 'Marketplace',
            status: 'Error',
            statusColor: Color(0xFFF59E0B),
            statusIcon: Icons.error,
            date: '20 May 2021',
            progress: 0.8,
          ),
          SizedBox(height: 20),
          _buildTableRow(
            name: 'Weekly Updates',
            status: 'Approved',
            statusColor: Color(0xFF10B981),
            statusIcon: Icons.check_circle,
            date: '12 Jul 2021',
            progress: 0.4,
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow({
    required String name,
    required String status,
    required Color statusColor,
    required IconData statusIcon,
    required String date,
    required double progress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: bold.copyWith(fontSize: 14),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(statusIcon, color: Colors.white, size: 16),
                ),
                SizedBox(width: 8),
                Text(
                  status,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              date,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: cardWithOpacity,
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5CF6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
