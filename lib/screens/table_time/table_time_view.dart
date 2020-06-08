import 'package:flutter/material.dart';
import 'package:ihust/models/Class.dart';
import 'package:ihust/screens/table_time/table_time_detail_view.dart';

List<dynamic> COLORBYDAY = [
  Colors.redAccent,
  Colors.orangeAccent,
  Colors.deepOrange,
  Colors.lightGreen,
  Colors.blueAccent,
  Colors.indigoAccent,
  Colors.purpleAccent,
];

class TableTimeView extends StatefulWidget {
  final String userId;
  List<Class> classes;

  TableTimeView(this.userId, this.classes);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<TableTimeView> {
  int sectionCount = 3;

  String get userId => widget.userId;

  List<Class> get classes => widget.classes;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Thời Khóa Biểu'),
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(icon: Icon(Icons.calendar_today)),
                      Tab(icon: Icon(Icons.calendar_view_day)),
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  calendarByWeek(classes),
                  calendarBySubject(classes),
                ]))));
  }
}

ListView calendarByWeek(List<Class> classes) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return new Stack(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: new Container(
                padding: EdgeInsets.all(7),
                child: Column(children: renderSubject(classes, index))),
          ),
          new Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 35.0,
            child: new Container(
              height: double.infinity,
              width: 5.0,
              color: Colors.blue,
            ),
          ),
          new Positioned(
            top: 20.0,
            left: 15.0,
            child: new Container(
              height: 40.0,
              width: 40.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: new Container(
                margin: new EdgeInsets.all(5.0),
                height: 30.0,
                width: 30.0,
                child: Text(
                  "Thứ $index",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      );
    },
    itemCount: 7,
  );
}

ListView calendarBySubject(List<Class> classes) {
  return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.all(5),
          color: (COLORBYDAY[index]),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
              height: 100.0,
              margin: EdgeInsets.all(8),
              child: Text(
                'MÔN: ' +
                    classes[index].name +
                    '\nSỐ TC: ' +
                    classes[index].creditInfo +
                    '\nMÃ LỚP: ' +
                    classes[index].classId +
                    '\nMÃ HỌC PHẦN: ' +
                    classes[index].courseId,
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
        );
      });
}

List<Widget> renderSubject(List<Class> listitem, int index) {
  List<Widget> listCard = new List();
  for (int i = 0; i < listitem.length; i++) {
    if (listitem[i].day == index) {
      listCard.add(Card(
        margin: EdgeInsets.all(5),
        color: (COLORBYDAY[i]),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          margin: EdgeInsets.all(8),
          width: double.infinity,
          height: 50.0,
          child: Text(
            listitem[i].name +
                '\nPhòng ' +
                listitem[i].calendars[0].place +
                '\nTiết: ' +
                listitem[i].calendars[0].from.toString() +
                ' - ' +
                listitem[i].calendars[0].to.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ));
    }
  }
  return listCard;
}
