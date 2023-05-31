import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';

class PianoScreen extends StatefulWidget {
  const PianoScreen({Key? key}) : super(key: key);

  @override
  State<PianoScreen> createState() => _PianoScreenState();
}

class _PianoScreenState extends State<PianoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Beep Success"),
              onPressed: () => FlutterBeep.beep(),
            ),
            ElevatedButton(
              child: Text("Beep Fail"),
              onPressed: () => FlutterBeep.beep(false),
            ),
            ElevatedButton(
              child: Text("Beep Android Custom"),
              onPressed: () => FlutterBeep.playSysSound(20),
            ),
            ElevatedButton(
              child: Text("Beep something"),
              onPressed: () => FlutterBeep.playSysSound(41),
            ),
            ElevatedButton(
              child: Text("Beep iOS Custom"),
              onPressed: () => FlutterBeep.playSysSound(40),
            ),
          ],
        ),
      ),
    );
  }
}
