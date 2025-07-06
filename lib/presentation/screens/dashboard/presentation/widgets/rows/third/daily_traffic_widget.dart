import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/config/theme/text_styles.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';

class DailyTrafficWidget extends StatelessWidget {
  const DailyTrafficWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LargeCard(
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Traffic',
                style: medium.copyWith(fontSize: 14, color: cardText),
              ),
              Row(
                children: [
                  Icon(Icons.arrow_drop_up, color: green, size: 12),
                  SizedBox(width: 2),
                  Text(
                    '+2.45%',
                    style: bold.copyWith(color: green, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text('2,579', style: bold.copyWith(fontSize: 34)),
              SizedBox(width: 8),
              Text(
                'Visitors',
                style: medium.copyWith(fontSize: 14, color: cardText),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            height: 120,
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
                          '00',
                          '04',
                          '08',
                          '12',
                          '14',
                          '16',
                          '18',
                        ];
                        if (value.toInt() < titles.length) {
                          return Text(
                            titles[value.toInt()],
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
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
                barGroups: List.generate(
                  8,
                  (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: (40 + Random().nextDouble() * (200 - 40)),
                        color: active,
                        width: 16,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
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
