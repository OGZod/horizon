import 'package:flutter/material.dart';
import 'package:horizon/core/presentation/widgets/button.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';

class CardSecurity extends StatelessWidget {
  const CardSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return LargeCard(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.fingerprint,size: 91,),
        Text('Control card security in-app with a tap'),
        Text('Discover our cards benefits, with one tap.'),
        SizedBox(
          width: double.infinity,
            child: Button(label: 'Card'))
      ],
    ));
  }
}
