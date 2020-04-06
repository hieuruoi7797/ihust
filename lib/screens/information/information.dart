import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_info/device_info.dart';


import 'package:ihust/blocs/information/information_bloc.dart';
import 'package:ihust/blocs/information/information_event.dart';
import 'package:ihust/utils/utils.dart';

class InformationScreen extends StatefulWidget {
  final String sessionId = ClientUtils.getDeviceDetails().toString() ;
  InformationScreen({Key key,String sessionId}) : super(key: key);
  @override
  _InformationState createState()=> _InformationState();
}
class _InformationState extends State<InformationScreen> {
  InformationBloc inforBloc;
  String get sessionId => widget.sessionId ?? -1;

  @override
  void initState(){
    inforBloc = BlocProvider.of<InformationBloc>(context);
    inforBloc.add(LoadInforBySessionId(sessionId: sessionId));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
