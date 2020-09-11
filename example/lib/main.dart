import 'package:flutter/material.dart';
import 'package:flutter_zoom_box/zoom_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double borderWidth = 4;
    double radius = 20;

    return MaterialApp(
      home: Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(radius + borderWidth)),
              border: Border.all(width: borderWidth)),
              child: ZoomBox(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                width: 250,
                height: 250,
                child: Image.network('https://picsum.photos/250?image=9'),
              ),
            ),
          )
        ),
    );
  }
}
