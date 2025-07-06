import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';

import '../../../../../../../config/theme/text_styles.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      height: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text('Your Pie Chart', style: bold)),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Monthly',
                      style: bold.copyWith(fontSize: 12, color: cardText),
                    ),
                    Icon(Icons.arrow_drop_down_rounded, color: cardText),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 143,
              height: 143,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: [
                    PieChartSectionData(
                      color: active,
                      value: 63,
                      title: '',
                      radius: 80,
                    ),
                    PieChartSectionData(
                      color: Color(0xFF06B6D4),
                      value: 25,
                      title: '',
                      radius: 80,
                    ),
                    PieChartSectionData(
                      color: Color(0xFF0EA5E9),
                      value: 12,
                      title: '',
                      radius: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: CustomCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: active,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Your files',
                              style: medium.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                         Text(
                            '63%',
                            style: bold.copyWith(fontSize: 18),
                          ),
                      ],
                    ),
                  ),

                  Container(width: 1, height: 40, color: Theme.of(context).dividerColor),
                  SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Color(0xFF06B6D4),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('System',
                              style: medium.copyWith(fontSize: 12),

                            ),
                          ],
                        ),
                        Text(
                          '25%',
                          style: bold.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
