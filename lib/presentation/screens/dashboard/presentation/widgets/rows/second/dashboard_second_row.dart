import 'package:flutter/material.dart';

import '../../../../../../../config/theme/app_colors.dart';
import '../../../../../../../config/theme/text_styles.dart';
import '../../../../../../../core/presentation/widgets/icons/horizon_icon.dart';
import '../../../../../../../core/presentation/widgets/icons/horizon_icons.dart';
import '../../dashboard_cards.dart';
import 'spending_chart.dart';
import 'weekly_revenue.dart';

class DashboardSecondRow extends StatelessWidget {
  const DashboardSecondRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Column(
            spacing: 12,
            children: [
              LargeCard(
                child: Column(
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCard(
                          child: Row(
                            spacing: 12,
                            children: [
                              Icon(Icons.calendar_today, size: 18),
                              Text(
                                'This month',
                                style: medium.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        CustomCard(
                          child: HorizonIcon(HousifyIcons.table, size: 18),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$37.5K',
                                    style: bold.copyWith(fontSize: 34),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Total Spent',
                                        style: medium.copyWith(
                                          fontSize: 14,
                                          color: cardText,
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Icon(
                                        Icons.arrow_drop_up,
                                        color: green,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '+2.45%',
                                        style: bold.copyWith(
                                          fontSize: 12,
                                          color: green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: green,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'On track',
                                        style: bold.copyWith(
                                          fontSize: 16,
                                          color: green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              ),
              LargeCard(child: WeeklyRevenueWidget()),
            ],
          );
        } else {
          return Row(
            spacing: 12,
            children: [
              Expanded(
                child: LargeCard(
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCard(
                            child: Row(
                              spacing: 12,
                              children: [
                                Icon(Icons.calendar_today, size: 18),
                                Text(
                                  'This month',
                                  style: medium.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          CustomCard(
                            child: HorizonIcon(HousifyIcons.table, size: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$37.5K',
                                  style: bold.copyWith(fontSize: 34),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Total Spent',
                                      style: medium.copyWith(
                                        fontSize: 14,
                                        color: cardText,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Icon(
                                      Icons.arrow_drop_up,
                                      color: green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '+2.45%',
                                      style: bold.copyWith(
                                        fontSize: 12,
                                        color: green,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'On track',
                                      style: bold.copyWith(
                                        fontSize: 16,
                                        color: green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Chart takes remaining space
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 200,
                              child: SpendingChart(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: LargeCard(child: WeeklyRevenueWidget())),
            ],
          );
        }
      },
    );
  }
}
