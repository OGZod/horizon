import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/core/presentation/widgets/icons/horizon_icon.dart';
import 'package:horizon/core/presentation/widgets/icons/horizon_icons.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';

import '../../../../../../../config/theme/text_styles.dart';

class WeeklyRevenueWidget extends StatelessWidget {
  const WeeklyRevenueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Weekly Revenue', style: bold.copyWith(fontSize: 24)),
            CustomCard(child: HorizonIcon(HousifyIcons.table, size: 18)),
          ],
        ),
        SizedBox(
          height: 150,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              maxY: 100,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      List<String> titles = [
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                        '22',
                        '23',
                        '24',
                        '25',
                      ];
                      if (value.toInt() < titles.length) {
                        return Text(
                          titles[value.toInt()],
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        );
                      }
                      return Text('');
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              backgroundColor: Colors.transparent,
              barGroups: List.generate(9, (index) {
                List<double> heights = [125, 75, 45, 90, 60, 80, 85, 50, 95];
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: heights[index],
                      color: active,
                      width: 16,
                      borderRadius: BorderRadius.circular(8),
                      rodStackItems: [
                        BarChartRodStackItem(
                          0,
                          heights[index] * 0.6,
                          active,
                        ),
                        BarChartRodStackItem(
                          heights[index] * 0.6,
                          heights[index] * 0.8,
                          Color(0xFF06B6D4),
                        ),
                        BarChartRodStackItem(
                          heights[index] * 0.8,
                          heights[index],
                          Color(0xFF9CA3AF),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
