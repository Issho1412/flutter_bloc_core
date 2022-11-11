// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/bloc_observer.dart';
import 'package:src_core_bloc/core/routes/locator.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';
import 'core/util/enum.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(() {
    runApp(
      FlavorConfig(
        appName: 'CORE DEV', 
        flavorName: FlavorType.PROD, 
        child: const MyApp()
      )
    );
  }, blocObserver: CustomBlocObserver());
}
