part of 'classes.dart';

class ClassessView extends StatefulWidget {
  final String userId;
  final Map<int, List<Class>> mapScholarYear;
  ClassessView({this.userId, this.mapScholarYear});
  @override
  _ClassessViewState createState() => _ClassessViewState();
}

class _ClassessViewState extends State<ClassessView> {
  int sectionCount = 3;
  Map<int, List<Class>> get mapScholarYear => widget.mapScholarYear;
  String get userId => widget.userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách lớp học"),
      ),
      body: makeBody(),
    );
  }

  int _rowCountAtSection(int section) {
    var entryList = mapScholarYear.entries.toList();
    return entryList[section].value.length;
  }

  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    var entryList = mapScholarYear.entries.toList();
    return InkWell(
      onTap: () {
        print(
            'click section header. -> section:${entryList[section].key.toString()}');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(220, 220, 220, 1),
        height: 100,
        child: Text(
          'Năm học :${entryList[section].key.toString()}',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _cellBuilder(BuildContext context, int section, int row) {
    var entryList = mapScholarYear.entries.toList();
    var listClass = entryList[section].value;
    var itemClass = listClass[row];
    return InkWell(
        onTap: () {
          print('click cell item. -> section:$section row:$row');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RichAlertDialog(
                  alertTitle: richTitle(itemClass.courseName),
                  alertSubtitle: richSubtitle(
                      "Mã học phần: ${itemClass.courseId}. Mã lớp: ${itemClass.classId}"),
                  alertSubtitle2:
                      richSubtitle(itemClass.calendarInfo + "!!!!Sai API thầy ơi"),
                  alertSubtitle3:
                      richSubtitle("${itemClass.studentNum}/${itemClass.studentNumRange} sinh viên"),
                  alertType: RichAlertType.SUCCESS,
                  actions: <Widget>[
                    FlatButton(
                      color: Colors.blueAccent,
                      child: Text("Đã nhớ :D"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
        child: makeCard(item: listClass[row]));
  }

  double _sectionHeaderHeight(BuildContext context, int section) {
    return 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 100.0;
  }

  makeBody() => Container(
        child: FlutterTableView(
          sectionCount: mapScholarYear.length,
          rowCountAtSection: _rowCountAtSection,
          sectionHeaderBuilder: _sectionHeaderBuilder,
          cellBuilder: _cellBuilder,
          sectionHeaderHeight: _sectionHeaderHeight,
          cellHeight: _cellHeight,
        ),
      );
  makeCard({Class item}) => Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(item: item),
        ),
      );
  makeListTile({Class item}) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        "${(item.courseName == "") ? "dữ liệu api trống" : item.courseName}",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.yellowAccent),
          Text("${item.courseId}. Số TC: ${item.creditInfo}",
              style: TextStyle(color: Colors.white))
        ],
      ),
      trailing: SizedBox(
        width: 50,
        child: Center(
            child: Text(
          item.semester,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ));
}
