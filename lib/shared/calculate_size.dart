import 'package:sizer/sizer.dart';

class CalculateSize {
  CalculateSize._();
  static const _width = 720;
  static const _height = 1280;

  static getWidth(int width) => ((width / _width) * 100).w;

  static getHeight(int height) => ((height / _height) * 100).h;
}
