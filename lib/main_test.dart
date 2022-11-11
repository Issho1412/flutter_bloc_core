// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/bloc_observer.dart';
import 'package:src_core_bloc/core/config/flavor_config.dart';
import 'package:src_core_bloc/core/routes/locator.dart';
import 'package:src_core_bloc/core/util/enum.dart';
import 'app.dart';

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
        appName: 'CORE TEST', 
        flavorName: FlavorType.TEST, 
        child: const MyApp()
      )
    );
  }, blocObserver: CustomBlocObserver());
}
