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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ZoomBox(
            height: 300,
            width: 300,
            borderRadius: 100,
            borderWidth: 5,
            borderColor: Colors.blue,
            backgroundColor: Colors.black,
            child: FittedBox(child: Image.network('https://picsum.photos/250?image=9'), fit: BoxFit.fill,),
          ),
        )
      ),
    );
  }
}
