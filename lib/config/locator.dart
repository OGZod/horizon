import 'package:get_it/get_it.dart';
import 'package:horizon/config/theme/theme_service.dart';

import 'navigation/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupInitialLocator() async {
  locator.registerLazySingleton<ThemeService>(() => ThemeService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
