import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ihust/blocs/authorize/authorize_bloc.dart';
import 'package:ihust/blocs/bloc_delegates.dart';
import 'package:ihust/blocs/classes/class_bloc.dart';
import 'package:ihust/routes.dart';
import 'package:ihust/screens/classes/classes.dart';
import 'package:ihust/screens/home/home_screen.dart';
import 'package:ihust/screens/login/login_screen.dart';
import 'package:ihust/screens/splash/splash_view_screen.dart';

import 'blocs/information/information_bloc.dart';
import 'blocs/question/question_bloc.dart';
import 'blocs/table_time/tabletime_bloc.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Streams are created so that app can  to notification-related events since the plugin is initialised in the `main` function

NotificationAppLaunchDetails notificationAppLaunchDetails;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        print("TEST ${title}");
      });
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    //TODO
        print("TEST }");
  });

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
      ),
      BlocProvider<QuestionBloc>(
        create: (context) => QuestionBloc(),
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
        primarySwatch: Colors.red,
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
