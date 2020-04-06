import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihust/blocs/authorize/authorize_bloc.dart';
import 'package:ihust/components/custom_dialog.dart';
import 'package:ihust/models/Student.dart';
import 'package:ihust/models/Teacher.dart';
import 'package:ihust/screens/classes/classes.dart';
import 'package:ihust/screens/information/information.dart';
part 'home_student_view.dart';
part 'home_teacher_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthorizeBloc, AuthorizeState>(
          listener: (context, state) {},
        ),
        // BlocListener<MyOtherBloc, MyOtherState>(
        //   listener: (context, state) {
        //     // TODO: implement listener
        //   },
        // ),
      ],
      child: BlocBuilder<AuthorizeBloc, AuthorizeState>(
        builder: (context, state) {
          if (state.user == null) {
            print("chúc mừng , đừng return nữa , lỗi cmnr!!!");
            return Scaffold();
          } else if (state.user is Student)
            return HomeViewStudent(user: state.user);
          else if (state.user is Teacher) {
            return HomeTeacherView();
          } else {
            print("chúc mừng , đừng return nữa , lỗi cmnrxxxx!!!");
            return Scaffold();
          }
        },
      ),
    );
  }
}
