
import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}


class MColors{
  const MColors._();

  static const white = Color(0xffffffff);
  static const black = Color(0x00000000);
  static Color primaryColor = hexToColor("#21cc9e");
  static Color scaffoldBgColorDark = hexToColor("#131720");
}