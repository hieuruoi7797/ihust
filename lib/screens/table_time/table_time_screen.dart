import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihust/blocs/classes/class_bloc.dart';
import 'package:ihust/blocs/table_time/tabletime_bloc.dart';
import 'package:ihust/models/Class.dart';

import 'table_time_view.dart';

class TableTimeScreen extends StatefulWidget{
  final String userId;

  TableTimeScreen ({Key key, this.userId}): super(key: key);
  @override
  _TableTimeScreenState createState() => _TableTimeScreenState();

}

class _TableTimeScreenState extends State<TableTimeScreen> {
  TabletimeBloc tabletimeBloc;
  String get userId => widget.userId ?? '-1';
  @override
  void initState(){
    tabletimeBloc = BlocProvider.of<TabletimeBloc>(context);
    tabletimeBloc.add(LoadClassesByStudentId(userId: userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TabletimeBloc, ClassState>(
      bloc: tabletimeBloc,
      listener: (context, state){
      },
      child: BlocBuilder<TabletimeBloc, ClassState>(
        bloc: tabletimeBloc,
        builder: (context, state){
          if (state.classes.isNotEmpty){
            return TableTimeView(
              userId,
              state.classes
            );
          }else if(state.isLoading){
            return Scaffold(
              appBar: AppBar(
                title: Text('Thoi Khoa Bieu'),
              ),
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: .7,
                ),
              )
            );
            }else{
              return Center(child: Text("Error"));
          }
        },
      )
    );
  }
}