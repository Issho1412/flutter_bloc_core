import 'package:get_it/get_it.dart';
import 'navigate_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}