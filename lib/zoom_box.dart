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
  final double borderWidth;
  final double borderRadius;
  final Color backgroundColor;
  final Color borderColor;

  ZoomBox(
      {Key key,
      this.alignment,
      this.padding,
      this.backgroundColor,
      this.borderColor = Colors.black,
      this.borderWidth = 0,
      this.borderRadius = 0,
      this.width,
      this.height,
      this.constraints,
      this.margin,
      @required this.child})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width + this.borderWidth,
      height: this.height + this.borderWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(this.borderRadius + this.borderWidth)),
          color: this.backgroundColor,
          border: Border.all(color: this.borderColor, width: this.borderWidth)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(this.borderRadius)),
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
      ),
    );
  }
}
