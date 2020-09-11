import 'package:flutter/cupertino.dart';

class Pos {
  double x = 0.0;
  double y = 0.0;

  Pos(x, y) {
    this.x = x;
    this.y = y;
  }
}

class ZoomModel extends ChangeNotifier {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Pos _pos = Pos(0.0, 0.0);
  Pos _nextPos = Pos(0.0, 0.0);
  Pos _previousPos = Pos(0.0, 0.0);
  Pos _endPos = Pos(0.0, 0.0);
  bool _isScaled = false;

  double get scale => _scale;
  double get previousScale => _previousScale;
  Pos get pos => _pos;
  Pos get previousPos => _previousPos;
  Pos get endPos => _endPos;
  bool get isScaled => _isScaled;

  bool _hasTouched = false;
  bool get hasTouched => _hasTouched;
  set hasTouched(value) {
    _hasTouched = value;
    notifyListeners();
  }

  void handleDragScaleStart(ScaleStartDetails details) {
    _hasTouched = true;
    _previousScale = _scale;
    _previousPos.x = (details.focalPoint.dx / _scale) - _endPos.x;
    _previousPos.y = (details.focalPoint.dy / _scale) - _endPos.y;
    notifyListeners();
  }

  void handleDragScaleUpdate(ScaleUpdateDetails details, double maxWidth, double maxHeight) {
    _scale = _previousScale * details.scale;
    if (_scale > 2.0) {
      _isScaled = true;
    } else {
      _isScaled = false;
    }

    if (_scale < 1.0) {
      _scale = 1.0;
      _pos.x = 0;
      _pos.y = 0;
    } else if (_scale > 4.0) {
      _scale = 4.0;
    } else if (_previousScale == _scale ) {
      _nextPos.x = (details.focalPoint.dx / _scale) - _previousPos.x;
      _nextPos.y = (details.focalPoint.dy / _scale) - _previousPos.y;

      if((maxWidth/2 - _nextPos.x.abs()) * _scale > maxWidth/2){
        _pos.x = _nextPos.x;
      }

      if((maxHeight/2 - _nextPos.y.abs()) * _scale > maxHeight/2)
        _pos.y = _nextPos.y;
    }
    else if(_previousScale> _scale){
      if((maxWidth/2 - _pos.x.abs()) * _scale <= maxWidth/2){
        if(_pos.x < 0)
          _pos.x = -1 * maxWidth / 2 * (1 - 1 / _scale);
        else
          _pos.x = maxWidth/2*(1- 1/_scale);
      }
      if((maxHeight/2 - _pos.y.abs()) * _scale <= maxHeight/2){
        if(_pos.y < 0)
          _pos.y = -1* maxHeight/2*(1- 1/_scale);
        else
          _pos.y = maxHeight/2*(1- 1/_scale);
      }
    }
    notifyListeners();
  }

  void handleDragScaleEnd() {
    _previousScale = 1.0;
    _endPos = _pos;
    notifyListeners();
  }
}
