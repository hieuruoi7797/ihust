import 'package:flutter/material.dart';
import 'package:ihust/models/Class.dart';
import 'package:ihust/screens/table_time/table_time_detail_view.dart';



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
                  calendarBySubject(),
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
              child: new Column(
                children: renderSubject(classes, index)
              )),
          new Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 35.0,
            child: new Container(
              height: double.infinity,
              width: 1.0,
              color: Colors.blue,
            ),
          ),
          new Positioned(
            top: 50.0,
            left: 15.0,
            child: new Container(
              height: 40.0,
              width: 40.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: new Container(
                margin: new EdgeInsets.all(5.0),
                height: 30.0,
                width: 30.0,
                child: Text(
                  "thứ $index",
                  textAlign: TextAlign.center,
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

ListView calendarBySubject() {
  return new ListView();
}

List<Widget> renderSubject(List<Class> listitem, int index){
  List<Widget> listCard = new List();
  for (int i = 0; i < listitem.length; i++){
    if (listitem[i].day == index) {
      listCard.add(Card(
        margin: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: 100.0,
          color: Colors.lightGreen,
          child: Text(listitem[i].name),
        ),
      ));
    }
  }
  return listCard;

}
