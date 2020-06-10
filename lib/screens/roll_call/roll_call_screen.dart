import 'package:flutter/material.dart';
import 'package:ihust/screens/roll_call/scan_screen.dart';

class RollCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR code Scanner & Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanScreen()),
                  );
                },
                child: const Text('SCAN QR CODE'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  splashColor: Colors.blueGrey,
                  onPressed: null,
//                      () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => GenerateScreen()),
//                    );
//                  },
                  child: const Text('GENERATE QR CODE')),
            ),
          ],
        ),
      ),
    );
  }
}
