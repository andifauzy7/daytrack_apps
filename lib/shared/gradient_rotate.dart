import 'dart:math';

import 'package:flutter/material.dart';

Alignment getGradientRotate(num degree) {
  degree -= 90;
  final x = cos(degree * pi / 180);
  final y = sin(degree * pi / 180);
  final xAbs = x.abs();
  final yAbs = y.abs();

  if ((0.0 < xAbs && xAbs < 1.0) || (0.0 < yAbs && yAbs < 1.0)) {
    final magnification = (1 / xAbs) < (1 / yAbs) ? (1 / xAbs) : (1 / yAbs);
    return Alignment(x, y) * magnification;
  } else {
    return Alignment(x, y);
  }
}
