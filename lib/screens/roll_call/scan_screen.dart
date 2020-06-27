import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihust/blocs/information/information_bloc.dart';
import 'package:ihust/blocs/question/question_bloc.dart';
import 'package:ihust/blocs/question/question_event.dart';
import 'package:ihust/blocs/question/question_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<ScanScreen> {
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
                          )),
                          new Image.network(
                              questionBloc.state.question.imageUrl),
                          new YoutubePlayer(
                            controller: new YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  questionBloc.state.question.videoUrl),
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent,
                            ),
                          ),
//                          new Container(
//                            padding: EdgeInsets.all(8),
//                            child: ListView.builder(itemBuilder: (, int index){
//                              return option(context, index, items);
//                            }),
//
//                          ),
                        ],
                      ),
                    ))
              ],
            ),
          );
        } else
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
      },
    );
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

  Widget Option(List<dynamic> items, int index) {
    return
      ListTile(
        title: Text(items[0].toString()),
        leading: Radio(value: null, groupValue: null, onChanged: null),
      );
  }

}

