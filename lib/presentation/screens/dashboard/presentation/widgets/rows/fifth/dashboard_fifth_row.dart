import 'package:flutter/material.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/fifth/card_security.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/fifth/lesson_card.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/fifth/star_buck.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/rows/fifth/team_members.dart';

class DashboardFifthRow extends StatelessWidget {
  const DashboardFifthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return Column(
            spacing: 12,
            children: [
              Row(
                spacing: 12,
                children: [
                  Expanded(child: LessonCard()),
                  Expanded(child: TeamMembers()),
                ],
              ),
              Row(
                spacing: 12,
                children: [
                  Expanded(child: CardSecurity()),
                  Expanded(child: StarBuck()),
                ],
              ),
            ],
          );
        } else if (constraints.maxWidth < 1200) {
          return Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(child: LessonCard()),
                    Expanded(child: TeamMembers()),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  spacing: 12,
                  children: [
                    Expanded(child: CardSecurity()),
                    Expanded(child: StarBuck()),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Row(
            spacing: 12,
            children: [
              Expanded(flex: 1, child: LessonCard()),
              Expanded(flex: 1, child: TeamMembers()),
              Expanded(flex: 1, child: CardSecurity()),
              Expanded(flex: 1, child: StarBuck()),
            ],
          );
        }
      },
    );
  }
}
