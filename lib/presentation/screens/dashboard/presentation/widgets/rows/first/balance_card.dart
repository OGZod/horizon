import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';

import '../../../../../../../config/theme/app_colors.dart';
import '../../../../../../../config/theme/text_styles.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  double baseBalanceUSD = 1000.0;

  Currency selectedCurrency = Currency.from(
    json: {
      'code': 'USD',
      'name': 'US Dollar',
      'symbol': '\$',
      'flag': 'USD',
      'decimal_digits': 2,
      'number': 840,
      'name_plural': 'US dollars',
      'thousands_separator': ',',
      'decimal_separator': '.',
      'space_between_amount_and_symbol': false,
      'symbol_on_left': true,
    },
  );

  // Simple exchange rates (in a real app, you'd fetch these from an API)
  final Map<String, double> exchangeRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.73,
    'JPY': 110.0,
    'CAD': 1.25,
    'AUD': 1.35,
    'CHF': 0.92,
    'CNY': 6.45,
    'INR': 74.5,
    'KRW': 1180.0,
  };

  // Popular currencies for the dropdown
  final List<String> popularCurrencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'CAD',
    'AUD',
    'CHF',
    'CNY',
    'INR',
    'KRW',
  ];

  double get convertedBalance {
    double rate = exchangeRates[selectedCurrency.code] ?? 1.0;
    return baseBalanceUSD * rate;
  }

  String get toFlag {
    return selectedCurrency.code.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );
  }

  void _showCurrencyDropdown() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 200,
        kToolbarHeight + 100,
        20,
        0,
      ),
      items: popularCurrencies.map((String currencyCode) {
        Currency currency = CurrencyService().findByCode(currencyCode)!;
        double convertedAmount =
            baseBalanceUSD * (exchangeRates[currencyCode] ?? 1.0);

        return PopupMenuItem<String>(
          value: currencyCode,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Text(
                  CurrencyUtils.currencyToEmoji(currency),
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currency.code,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        currency.name,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Text(
                  _formatCurrency(convertedAmount, currency),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[700],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).then((String? selected) {
      if (selected != null) {
        Currency? newCurrency = CurrencyService().findByCode(selected);
        if (newCurrency != null) {
          setState(() {
            selectedCurrency = newCurrency;
          });
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Row(
          //       children: [
          //         Text(CurrencyUtils.currencyToEmoji(selectedCurrency)),
          //         SizedBox(width: 8),
          //         Text('Switched to ${selectedCurrency.name}'),
          //       ],
          //     ),
          //     duration: Duration(seconds: 2),
          //     backgroundColor: Colors.green,
          //   ),
          // );
        }
      }
    });
  }

  String _formatCurrency(double amount, Currency currency) {
    if (currency.code == 'JPY' || currency.code == 'KRW') {
      // No decimal places for these currencies
      return '${currency.symbol}${amount.round().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},')}';
    }

    String formattedAmount = amount.toStringAsFixed(currency.decimalDigits);
    List<String> parts = formattedAmount.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    String formattedInteger = integerPart.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    );

    String result = formattedInteger;
    // decimalPart.isNotEmpty
    //     ? '$formattedInteger.$decimalPart'

    return currency.symbolOnLeft
        ? '${currency.symbol}$result'
        : '$result${currency.symbol}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      width: 191,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            spacing: 3,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your balance',
                style: medium.copyWith(color: cardText, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                _formatCurrency(convertedBalance, selectedCurrency),
                overflow: TextOverflow.ellipsis,
                style: bold.copyWith(fontSize: 24),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => _showCurrencyDropdown(),
            child: Row(
              children: [
                CircleAvatar(
                  child:
                      selectedCurrency.flag?.toLowerCase() ==
                          'usd'
                      ? Image.asset('assets/images/us_flag.png')
                      : Text(
                          CurrencyUtils.currencyToEmoji(selectedCurrency),
                          style: TextStyle(fontSize: 18),
                        ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
