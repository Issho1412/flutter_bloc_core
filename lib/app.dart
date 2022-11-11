import 'package:flutter/material.dart';
import 'core/config/theme/basic_theme.dart';
import 'core/routes/locator.dart';
import 'core/routes/navigate_service.dart';
import 'core/util/globals.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      scaffoldMessengerKey: GlobalsKey.snackbarKey,
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: splashRoute,
      onGenerateRoute: RouteList.generateRoute,
    );
  }
}