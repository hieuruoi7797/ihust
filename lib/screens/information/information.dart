import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ihust/blocs/information/information_bloc.dart';
import 'package:ihust/blocs/information/information_event.dart';
import 'package:ihust/blocs/information/information_state.dart';
import 'package:ihust/utils/utils.dart';

import 'information_view.dart';

class InformationScreen extends StatefulWidget {
//  final String sessionId  ;
//  InformationScreen({Key key,this.sessionId}) : super(key: key);
  @override
  _InformationState createState()=> _InformationState();
}
class _InformationState extends State<InformationScreen> {
  InformationBloc inforBloc;
//String sessionId = 'd8fd312caaf1fbbb';
  @override
  void initState(){
    inforBloc = BlocProvider.of<InformationBloc>(context);
    inforBloc.add(LoadInforBySessionId());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<InformationBloc, InformationState>(
      bloc: inforBloc,
      listener: (context, state){
      },
      child:BlocBuilder<InformationBloc, InformationState>(
        bloc: inforBloc,
        builder: (context, state){
          if (state.user == null){
            print("Loading user error");
            return Scaffold();
          }else if (state.user != null){
            return InformationView(user: state.user);
          }else{
            print("Loading user error");
            return Scaffold();
          }
        },
      ),
    );
  }
}
