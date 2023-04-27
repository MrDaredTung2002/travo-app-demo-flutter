import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff6357CC);
  static const Color secondColor = Color(0xff8f67e8);
  static const Color yellowColor = Color(0xfffe9c5e);
  static const Color lightGray = Color(0xffD8D8D8);

  static const Color dividerColor = Color(0xffe5e7ed);
  static const Color textColor = Color(0xff323b4b);
  static const Color subTitleColor = Color(0xff838383);
  static const Color backgroundScaffoldColor = Color(0xfff2f2f2);
}

class GradientPalette {
  static const LinearGradient defaultGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [ColorPalette.secondColor, ColorPalette.primaryColor]);
}
