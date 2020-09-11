import 'package:flutter/material.dart';
import './raw_gesture_detector_widget.dart';
import './zoom_model.dart';
import 'package:provider/provider.dart';

class ZoomBox extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry margin;
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Color backgroundColor;

  ZoomBox(
      {Key key,
      this.alignment,
      this.padding,
      this.backgroundColor,
      this.borderRadius = const BorderRadius.all(Radius.circular(0)),
      @required this.width,
      @required this.height,
      this.constraints,
      this.margin,
      @required this.child})
      : assert(child != null),
        assert(width != null),
        assert(height != null);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: this.borderRadius,
      child: Container(
        alignment: this.alignment,
        padding: this.padding,
        constraints: this.constraints,
        margin: this.margin,
        width: this.width,
        height: this.height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ChangeNotifierProvider(
              create: (context) => ZoomModel(),
              child: RawGestureDetectorWidget(
                  constraints: constraints,
                  color: this.backgroundColor,
                  child: this.child),
            );
          },
        ),
      ),
    );
  }
}
