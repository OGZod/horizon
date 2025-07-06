import 'package:flutter/material.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/third/pie_chart_widget.dart';

import '../../dashboard_cards.dart';
import 'check_table.dart';
import 'daily_traffic_widget.dart';

class DashboardThirdRow extends StatelessWidget {
  const DashboardThirdRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return Column(
            spacing: 12,
            children: [
              LargeCard(height: 350, child: CheckTableWidget()),
              Row(
                spacing: 12,
                children: [
                  Expanded(child: DailyTrafficWidget()),
                  Expanded(child: PieChartWidget()),
                ],
              ),
            ],
          );
        } else if (constraints.maxWidth < 1200) {
          return Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 3,
                child: LargeCard(height: 350, child: CheckTableWidget()),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  spacing: 12,
                  children: [
                    Expanded(child: DailyTrafficWidget()),
                    Expanded(child: PieChartWidget()),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 2,
                child: LargeCard(height: 350, child: CheckTableWidget()),
              ),
              Expanded(flex: 1, child: DailyTrafficWidget()),
              Expanded(flex: 1, child: PieChartWidget()),
            ],
          );
        }
      },
    );
  }
}
