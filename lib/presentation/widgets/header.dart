import 'package:flutter/material.dart';
import 'package:horizon/config/theme/theme_service.dart';

import '../../config/locator.dart';
import '../../config/navigation/navigation_service.dart';
import '../../config/theme/text_styles.dart';
import '../../core/presentation/widgets/icons/horizon_icon.dart';
import '../../core/presentation/widgets/icons/horizon_icons.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pages/${locator<NavigationService>().currentPage}',
              style: medium.copyWith(fontSize: 14),
            ),
            Text(
              locator<NavigationService>().currentIndex == 0
                  ? 'Main ${locator<NavigationService>().currentPage}'
                  : locator<NavigationService>().currentPage,
              style: bold.copyWith(fontSize: 34),
            ),
          ],
        ),
        Container(
          width: 422,
          height: 61,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadiusGeometry.circular(48),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                width: 214,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  spacing: 8,
                  children: [
                    HorizonIcon(HousifyIcons.search, size: 11),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search',
                          hintStyle: regular.copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              HorizonIcon(HousifyIcons.notification),
              InkWell(
                onTap: () async {
                  await locator<ThemeService>().toggleTheme();
                },
                child: HorizonIcon(HousifyIcons.moonSolid, size: 20),
              ),
              HorizonIcon(HousifyIcons.infoOutline),
              ClipOval(
                child: Image.asset(
                  'assets/images/header_avatar.png',
                  height: 41,
                  width: 41,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
