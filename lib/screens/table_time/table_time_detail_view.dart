import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ihust/models/Calendar.dart';
import 'package:ihust/models/Class.dart';

class TimeTableDetail extends StatefulWidget{
  final String day;
  final List<Class> classes;
  TimeTableDetail(this.day,this.classes);
  @override
  _TimeTableDetailState createState() => _TimeTableDetailState();

}

class _TimeTableDetailState extends State<TimeTableDetail> {
  String get day => widget.day;
  List<Class> get classes => widget.classes;
  @override
  Widget build(BuildContext context) {
    if (classes.isNotEmpty) {
      // TODO: implement build
      print("check ${classes.length}");
      return Scaffold(
        appBar: AppBar(title: Text(day),),
        body: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text('${classes[index].name}'),
            );
            }));
    }else {
      return Scaffold(
          appBar: AppBar(title: Text(day),),
          body: Text(' Không có lớp học nào vào ngày này !')
      );
    }
  }

//   makeView(List<Class> classes) {
//    for (var i = 0; i < classes.length; i++) {
//          return  ListTile(
//              title: Text(classes[i].name));
//    }
//  }
}