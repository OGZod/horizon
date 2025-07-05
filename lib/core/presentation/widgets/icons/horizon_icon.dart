import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class HorizonIcon extends StatelessWidget {
  const HorizonIcon(
      this.iconData, {
        super.key,
        this.size = 24.0,
        this.color,
      });
  final String iconData;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconData,
      color: color,
      width: size,
      fit: BoxFit.fitWidth,
    );
  }
}
