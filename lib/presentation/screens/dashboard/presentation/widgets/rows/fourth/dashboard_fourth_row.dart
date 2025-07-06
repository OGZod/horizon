import 'package:flutter/material.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/fourth/tasks.dart';

import 'calendar.dart';
import 'complex_table_widget.dart';

class DashboardFourthRow extends StatelessWidget {
  const DashboardFourthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return Column(
            spacing: 12,
            children: [
              ComplexTableWidget(),
              Row(
                spacing: 12,
                children: [
                  Expanded(child: TasksCard()),
                  Expanded(child: CalendarCard()),
                ],
              ),
            ],
          );
        } else if (constraints.maxWidth < 1200) {
          return Row(
            spacing: 12,
            children: [
              Expanded(flex: 3, child: ComplexTableWidget()),
              Expanded(
                flex: 2,
                child: Column(
                  spacing: 12,
                  children: [
                    Expanded(child: TasksCard()),
                    Expanded(child: CalendarCard()),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Row(
            spacing: 12,
            children: [
              Expanded(flex: 2, child: ComplexTableWidget()),
              Expanded(flex: 1, child: TasksCard()),
              Expanded(flex: 1, child: CalendarCard()),
            ],
          );
        }
      },
    );
  }
}
