import 'package:flutter/material.dart';
import 'package:testvideo/states/play_video.dart';
import 'package:testvideo/states/upload_video.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlayVideo(),
    );
  }
}
