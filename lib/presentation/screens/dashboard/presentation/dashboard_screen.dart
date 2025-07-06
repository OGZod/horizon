import 'package:flutter/material.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/fifth/dashboard_fifth_row.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/fourth/dashboard_fourth_row.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/second/dashboard_second_row.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/third/dashboard_third_row.dart';

import 'widgets/rows/first/dashboard_first_row.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          spacing: 12,
          children: [
            DashboardFirstRow(),
            DashboardSecondRow(),
            DashboardThirdRow(),
            DashboardFourthRow(),
            DashboardFifthRow(),
          ],
        ),
      ),
    );
  }
}

