import 'package:flutter/material.dart';
import 'package:horizon/presentation/widgets/upgrade_pro_card.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/text_styles.dart';
import '../../core/presentation/widgets/icons/horizon_icons.dart';
import 'custom_nav_tile.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      width: 290,
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'HORIZON ',
                      style: poppinsBold.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'FREE',
                      style: poppinsRegular.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).dividerColor,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  CustomNavTile(
                    icon: HousifyIcons.home,
                    title: 'Dashboard',
                    index: 0,
                  ),
                  CustomNavTile(
                    icon: HousifyIcons.cart,
                    title: 'NFT Marketplace',
                    index: 1,
                  ),
                  CustomNavTile(
                    icon: HousifyIcons.table,
                    title: 'Tables',
                    index: 2,
                  ),
                  CustomNavTile(
                    icon: HousifyIcons.kanban,
                    title: 'Kanban',
                    index: 3,
                  ),
                  CustomNavTile(
                    icon: HousifyIcons.profile,
                    title: 'Profile',
                    index: 4,
                  ),
                  CustomNavTile(
                    icon: HousifyIcons.lock,
                    title: 'Sign In',
                    index: 5,
                  ),
                ],
              ),
            ),
          ),

          Center(child: UpgradeProCard()),
        ],
      ),
    );
  }
}
