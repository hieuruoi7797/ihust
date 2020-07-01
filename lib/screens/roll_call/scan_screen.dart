import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihust/blocs/information/information_bloc.dart';
import 'package:ihust/blocs/question/question_bloc.dart';
import 'package:ihust/blocs/question/question_event.dart';
import 'package:ihust/blocs/question/question_state.dart';
import 'package:ihust/utils/services.dart';
import 'package:ihust/utils/utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

enum RadioValue { A, B, C, D }

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<ScanScreen> {
  int theAnswer = 0;
  RadioValue _groupValue = RadioValue.A;
  static QuestionBloc questionBloc = new QuestionBloc();
  String barcode = "";

  @override
  void initState() {
    questionBloc = BlocProvider.of<QuestionBloc>(context);
    scan();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
      bloc: questionBloc,
      builder: (BuildContext context, QuestionState state) {
        if (questionBloc.state.question != null) {
          List<dynamic> items = questionBloc.state.question.options;
          items.add(questionBloc.state.question.answer);
          return Scaffold(
            appBar: new AppBar(
              title: new Text('QR CODE SCANNER'),
            ),
            body: new Stack(
              children: <Widget>[
                new Container(
                    padding: EdgeInsets.all(16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 32,
                      child: ListView(
                        padding: EdgeInsets.all(8),
                        children: <Widget>[
                          new Center(
                              child: Text(
                            questionBloc.state.question.question,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                            ),
                          )), ///Text Question
                          new Container(
                            padding: EdgeInsets.all(8),
                            child: Image.network(
                                questionBloc.state.question.imageUrl),
                          ),///Image Question
                          new YoutubePlayer(
                            controller: new YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  questionBloc.state.question.videoUrl),
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                                mute: true,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent,
                            ),
                          ),///Video Question
                          new Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(items[0]),
                                leading: Radio(
                                  value: RadioValue.A,
                                  groupValue: _groupValue,
                                  onChanged: (RadioValue value) {
                                    setState(() {
                                      _groupValue = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(items[1]),
                                leading: Radio(
                                  value: RadioValue.B,
                                  groupValue: _groupValue,
                                  onChanged: (RadioValue value) {
                                    setState(() {
                                      _groupValue = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(items[2]),
                                leading: Radio(
                                  value: RadioValue.C,
                                  groupValue: _groupValue,
                                  onChanged: (RadioValue value) {
                                    setState(() {
                                      _groupValue = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(items[3]),
                                leading: Radio(
                                  value: RadioValue.D,
                                  groupValue: _groupValue,
                                  onChanged: (RadioValue value) {
                                    setState(() {
                                      _groupValue = value;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),///Radio Button Answers
                          new Container(
                            padding: EdgeInsets.all(8),
                            child: RaisedButton(
                              color: Colors.red,
                              textColor: Colors.white,
                              splashColor: Colors.blueGrey,
//                              onPressed: sendTheAnswer("20158136","3",barcode),
                              child: const Text('Xác nhận'),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          );
        } else
          return _newScanScreen();
      },
    );
  }

  Scaffold _newScanScreen(){
    return Scaffold(
        appBar: new AppBar(
          title: new Text('QR CODE SCANNER'),
        ),
        body: Center(
          child: RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            splashColor: Colors.blueGrey,
            onPressed: scan,
            child: const Text('STAT CAMERA SCAN'),
          ),
        ));
  }

  Future scan() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      this.barcode = barcode.rawContent;
      questionBloc.add(LoadQuestion(
        data: this.barcode,
      ));
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.red, width: 3.0),
      borderRadius: BorderRadius.all(
          Radius.circular(20.0) //         <--- border radius here
          ),
    );
  }

//  Stream<QuestionState> sendTheAnswer(String studentId, String answer, String barcode) async* {
//    AppServices services = new AppServices(
//        action: "getquestion&sessionid=$studentId&data=$answer",
//        body: null);
//    try {
//  }
//}


sendTheAnswer(String s, String t, String barcode) async {
  String sessionId = await ClientUtils.getDeviceDetails();
  AppServices services = new AppServices(
      action: "rollcall&sessionid=$sessionId&userid=$s&data=$barcode&answer=$t",
      body: null);
}
}