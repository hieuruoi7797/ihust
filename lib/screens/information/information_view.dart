import 'package:flutter/material.dart';
import 'package:ihust/models/Student.dart';
import 'dart:ui' as ui;

import 'package:url_launcher/url_launcher.dart';

class InformationView extends StatefulWidget {
  final String sessionId;
  final Student user;

  const InformationView({Key key, this.sessionId, this.user}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<InformationView> {
  Student get user => widget.user;

  String get sessionId => widget.sessionId;

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Thông Tin Sinh Viên"),
//      ),
//      body: makeBody(),
//    );
//  }
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.0-9/s960x960/49690808_2168414076555770_3309356203754127360_o.jpg?_nc_cat=100&_nc_sid=e007fa&_nc_ohc=lNkpGFsKK2IAX_34NXv&_nc_ht=scontent.fhan2-4.fna&_nc_tp=7&oh=01e91a3c4b5ed59a254454e2fdbd9f48&oe=5F04132A';

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.red,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
            appBar: new AppBar(
              title: new Text("Thông Tin Sinh Viên"),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: _height / 12,
                  ),
                  new CircleAvatar(
                    radius: _width < _height ? _width / 4 : _height / 4,
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                  new SizedBox(
                    height: _height / 25.0,
                  ),
                  new Text(
                    user.fullName,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.white),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 30, left: _width / 8, right: _width / 8),
                    child: new Text(
                      'MSSV: ' +
                          user.studentId +
//                          '\nViện: Công nghệ Thông tin và Truyền thông' +
//                          user.className +
                          '\nNiên khóa: K' +
                          user.studentYear.toString(),
                      style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: _width / 25,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Divider(
                    height: _height / 30,
                    color: Colors.white,
                  ),
                  new Row(
                    children: <Widget>[
                      rowCell('NGOẠI NGỮ', user.englishInfo),
                      rowCell('CPA', user.cpa.toString()),
                      rowCell('LỚP', user.className),
                    ],
                  ),
                  new Divider(height: _height / 30, color: Colors.white),
                  new Padding(
                    padding: new EdgeInsets.only(
                        left: _width / 8, right: _width / 8),
                    child: InkWell(
                      child: FlatButton(
                        color: Colors.white70,
                        child: new Text("Download CV"),
                        onPressed: () => launch(user.cvUrl.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget rowCell(String count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(
            '$count',
            style: new TextStyle(color: Colors.white),
          ),
          new Text(type,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal))
        ],
      ));
}
