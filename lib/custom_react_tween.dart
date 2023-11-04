import 'dart:ui';

import 'package:flutter/material.dart';

class CustomRectTween extends RectTween {
  CustomRectTween({super.begin, super.end});

  @override
  Rect lerp(double t) {
    return Rect.fromPoints(
      Offset(
        lerpDouble(begin!.topLeft.dx, end!.topLeft.dx, t) ?? 0,
        lerpDouble(begin!.topLeft.dy, end!.topLeft.dy, t) ?? 0,
      ),
      Offset(
        lerpDouble(begin!.bottomRight.dx, end!.bottomRight.dx, t) ?? 0,
        lerpDouble(begin!.bottomRight.dy, end!.bottomRight.dy, t) ?? 0,
      ),
    );
  }
}
