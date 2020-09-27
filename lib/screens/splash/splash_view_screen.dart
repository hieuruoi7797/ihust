import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihust/blocs/authorize/authorize_bloc.dart';
import 'package:ihust/models/Student.dart';
import 'package:ihust/screens/home/home_screen.dart';
import 'package:ihust/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizeBloc, AuthorizeState>(
        listener: (context, state) {
          if (state.error == null && state.user != null) {
            if (state.user is Student) {
              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (context) => HomeScreen()));
            }
          } else {
            print("login with sessionId error: " + state.error.toString());
            Navigator.of(context).pushReplacement(
                new MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        },
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              strokeWidth: 0.7,
              // value: .7,
            ),
          ),
        ));
  }
}
