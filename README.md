# flutter_zoom_box
A widget that makes child widget zoomable. This widget can be applicable for not only images but also any other widgets.

![zoom_box_demo](./screenshot/zoom_box_demo.gif)

It works on Android and iOS.

## How to use
~~~
import 'package:flutter_zoom_box/zoom_box.dart';
~~~

Use widget named 'ZoomBox' and give width, height and child which you want to wrap with as parameters. These three parameters are required ones.
~~~
Scaffold(
    body: Center(
        child: ZoomBox(
            width: 250,
            height: 250,
            child: Image.network('https://picsum.photos/250?image=9'),
        ),
    )
)
~~~

Additionally, if you want to add a border in ZoomBox like gif shown, refer to the codes below.
~~~
Scaffold(
  body: Center(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius + borderWidth)),
        border: Border.all(width: borderWidth)),
      child: ZoomBox(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        width: 250,
        height: 250,
        child: Image.network('https://picsum.photos/250?image=9'),
      ),
    ),
  )
);
~~~

