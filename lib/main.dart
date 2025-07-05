import 'package:flutter/material.dart';
import 'package:horizon/presentation/screens/horizon_free_screen.dart';

import 'config/locator.dart';
import 'config/theme/theme_mode.dart';
import 'config/theme/theme_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInitialLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizon',
      debugShowCheckedModeBanner: false,
      themeMode: locator<ThemeService>().themeMode,
      darkTheme: AppThemeMode.darkTheme,
      theme: AppThemeMode.lightTheme,
      home: HorizonFreeScreen(),
    );
  }
}

