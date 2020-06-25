import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('QR CODE SCANNER'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
            decoration: myBoxDecoration(),
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 64.0, top: 8.0),
            child: Text(
              barcode,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
              margin:
                  EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
              decoration: myBoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
//                selectionHeightStyle: BoxHeightStyle,
                expands: false,
                minLines: 20,
                maxLines: 100,
                decoration: InputDecoration(hintText: 'Enter the answer'),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              onPressed: scan,
              child: const Text('STAT CAMERA SCAN'),
            ),
          ),
        ],
      ),
    );
  }

  Future scan() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode.rawContent);
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
}
