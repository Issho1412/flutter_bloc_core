// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/bloc_observer.dart';
import 'package:src_core_bloc/core/config/theme/basic_theme.dart';
import 'package:src_core_bloc/core/routes/locator.dart';
import 'package:src_core_bloc/core/routes/navigate_service.dart';
import 'package:src_core_bloc/core/util/globals.dart';
import 'package:src_core_bloc/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: CustomBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      // home:  const SplashPage(),
      scaffoldMessengerKey: GlobalsKey.snackbarKey,
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: splashRoute,
      onGenerateRoute: RouteList.generateRoute,
    );
  }
}