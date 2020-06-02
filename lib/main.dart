import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihust/blocs/authorize/authorize_bloc.dart';
import 'package:ihust/blocs/bloc_delegates.dart';
import 'package:ihust/blocs/classes/class_bloc.dart';
import 'package:ihust/routes.dart';
import 'package:ihust/screens/classes/classes.dart';
import 'package:ihust/screens/home/home_screen.dart';
import 'package:ihust/screens/login/login_screen.dart';
import 'package:ihust/screens/splash/splash_view_screen.dart';


import 'blocs/information/information_bloc.dart';
import 'blocs/table_time/tabletime_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    BlocSupervisor.delegate = AppBlocDelegate();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthorizeBloc>(
        create: (context) => AuthorizeBloc()..add(AppStarted()),
      ),
      BlocProvider<ClassBloc>(
        create: (context) => ClassBloc(),
      ),
      BlocProvider<InformationBloc>(
        create: (context) => InformationBloc(),
      ),
      BlocProvider<TabletimeBloc>(
        create: (context) => TabletimeBloc(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateTitle: (BuildContext context) => "iHust",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: <String, WidgetBuilder>{
        Routes.login: (context) => LoginScreen(),
        Routes.splash: (context) => SplashScreen(),
        //  Routes.splash : (_) => StudyPlan2(),
        Routes.home: (_) => HomeScreen(),
        Routes.classes: (_) => ClassesListScreen()
      },
    );
  }
}
