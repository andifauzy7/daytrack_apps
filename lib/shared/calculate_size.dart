import 'package:sizer/sizer.dart';

class CalculateSize {
  CalculateSize._();
  static const _width = 390;
  static const _height = 844;

  static getWidth(int width) => ((width / _width) * 100).w;

  static getHeight(int height) => ((height / _height) * 100).h;
}
