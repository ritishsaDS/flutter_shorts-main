import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shorts/screens/Audios.dart';

import 'Camerascreen.dart';
import 'Mymusic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Audios(),
    );
  }
}