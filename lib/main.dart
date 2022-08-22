// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/bloc_observer.dart';
import 'package:src_core_bloc/core/config/theme/basic_theme.dart';
import 'package:src_core_bloc/core/routes/locator.dart';
import 'package:src_core_bloc/core/routes/navigate_service.dart';
import 'package:src_core_bloc/features/counter/bloc/counter_bloc.dart';
import 'package:src_core_bloc/features/counter/bloc/counter_event.dart';
import 'package:src_core_bloc/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: splashRoute,
      onGenerateRoute: RouteList.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, BaseState>(
      bloc: _counterBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${_counterBloc.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _counterBloc.add(OnChangeCount());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
