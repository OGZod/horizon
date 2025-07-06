import 'package:flutter/material.dart';

import '../../../../../../../core/presentation/widgets/icons/horizon_icons.dart';
import 'balance_card.dart';
import '../../dashboard_cards.dart';

class DashboardFirstRow extends StatelessWidget {
  const DashboardFirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 12,
          children: [
            DashBoardSmallCard(
              title: 'Earnings',
              body: '\$350.4',
              icon: HousifyIcons.table,
            ),
            DashBoardSmallCard(
              title: 'Spend this month',
              body: '\$682.5',
              icon: HousifyIcons.dollar,
            ),
            DashBoardSmallCard(
              title: 'Sales',
              body: '\$574.34',
              subtitle: 'since last month',
            ),
            BalanceCard(),
            DashBoardSmallCard(
              title: 'New Tasks',
              body: '154',
              icon: HousifyIcons.checkPlus,
              iconBg: Color(0xff04BEFE),
            ),
            DashBoardSmallCard(
              title: 'Total Project',
              body: '2935',
              icon: HousifyIcons.file,
            ),
          ],
        ),
      ),
    );
  }
}
