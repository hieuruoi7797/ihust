import 'package:flutter/material.dart';
import 'package:ihust/models/Student.dart';

class InformationView extends StatefulWidget{
  final String sessionId;
  final Student user;
  const InformationView({Key key, this.sessionId, this.user}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<InformationView>{
  Student get user => widget.user;
  String get sessionId => widget.sessionId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông Tin Sinh Viên"),
      ),
      body: makeBody(),
    );
  }

  makeBody()=> Container (
    child: Text( user.fullName.toString()),
  );

  }


