import 'package:flutter/material.dart';
import 'package:ihust/models/Class.dart';
import 'package:ihust/screens/table_time/table_time_detail_view.dart';

class TableTimeView extends StatefulWidget {
  final String userId;
  List<Class> monClasses = new List();
  List<Class> tueClasses = new List();
  List<Class> wedClasses = new List();
  List<Class> thuClasses = new List();
  List<Class> friClasses = new List();
  List<Class> satClasses = new List();
  List<Class> sunClasses = new List();
  TableTimeView(this.userId,
      this.monClasses,
      this.tueClasses,
      this.wedClasses,
      this.thuClasses,
      this.friClasses,
      this.satClasses,
      this.sunClasses);

  @override
  _CalendarState createState() => _CalendarState();

}

class _CalendarState extends State<TableTimeView> {
  int sectionCount = 3;
  String get userId => widget.userId;
  List<Class> get monClasses => widget.monClasses;
  List<Class> get tueClasses => widget.tueClasses;
  List<Class> get wedClasses => widget.wedClasses;
  List<Class> get thuClasses => widget.thuClasses;
  List<Class> get friClasses => widget.friClasses;
  List<Class> get satClasses => widget.satClasses;
  List<Class> get sunClasses => widget.sunClasses;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Thời Khóa Biểu'),
      ),
      body: makeBody(this.context, monClasses,
          tueClasses, wedClasses, thuClasses,
          friClasses, satClasses, sunClasses),
    );
  }
}

Widget makeBody(BuildContext context, List<Class> monClasses,
    List<Class> tueClasses, List<Class> wedClasses, List<Class> thuClasses,
    List<Class> friClasses, List<Class> satClasses, List<Class> sunClasses) {
  return ListView (
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          title: Text('Monday'),
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> TimeTableDetail('Monday',monClasses)));
          },
        ),
        ListTile(
          title: Text('Tuesday'),
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> TimeTableDetail('Tuesday',tueClasses)));
          },
        ),
        ListTile(
          title: Text('Wednesday'),
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> TimeTableDetail('Wednesday',wedClasses)));
          },
        ),
        ListTile(
          title: Text('Thursday'),
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> TimeTableDetail('Thursday',thuClasses)));
          },
        ),
        ListTile(
          title: Text('Friday'),
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> TimeTableDetail('Friday',friClasses)));
          },
        ),
        ListTile(
          title: Text('Saturday'),
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> TimeTableDetail('Saturday',satClasses)));
          },
        ),
        ListTile(
          title: Text('Sunday'),
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> TimeTableDetail('Sunday',sunClasses)));
          },
        )
      ],
    ).toList()
  );

}