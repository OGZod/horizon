import 'package:flutter/material.dart';
import 'package:horizon/config/locator.dart';
import 'package:horizon/config/navigation/navigation_service.dart';
import 'package:horizon/config/theme/text_styles.dart';

import '../../config/theme/app_colors.dart';
import '../../core/presentation/widgets/icons/horizon_icon.dart';

class CustomNavTile extends StatelessWidget {
  const CustomNavTile({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  final String icon;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () async {
          await locator<NavigationService>().setIndex(index,title);
        },
        child: Container(
          height: 36,
          width: 257,
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            spacing: 12,
            children: [
              HorizonIcon(icon),
              Text(title, style: bold),
              Spacer(),
              Visibility(
                visible: index == locator<NavigationService>().currentIndex,
                child: Container(
                  height: 36,
                  width: 4,
                  decoration: BoxDecoration(
                    color: active,
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
