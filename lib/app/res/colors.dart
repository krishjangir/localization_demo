import 'package:flutter/material.dart';

import 'hex_color.dart';

//This class is used for app colors
class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };

  static MaterialColor materialColorPrimary =
      const MaterialColor(0xFFE69138, orange);

  //App Colors
  static Color colorPrimary = HexColor("#199EFF");
  static Color colorPrimaryDark = HexColor("#199EFF");
  static Color colorAccent = HexColor("#5ED2F3");

//custom colors
  static Color colorBackground = HexColor("#FFFFFF");
  static Color colorText = HexColor("#000000");
  static Color colorWhite = HexColor("#FFFFFF");

//App color
  static Color colorGray = HexColor("#999EA1");
  static Color colorGrayLight = HexColor("#F5F5F8");
  static Color colorGrayLight2 = HexColor("#F2F2F2");
  static Color colorCommonFishBtn = HexColor("#19B0D4");
  static Color colorCynTransparent = HexColor("#5ED2F3");
  static Color colorCynTransparent2 = HexColor("#5DC8E8");
  static Color colorCynTransparent3 = HexColor("#D4F3F3");
  static Color colorBannedSpeciesBtn = HexColor("#264267");
  static Color colorBlack = HexColor("#000000");
  static Color colorSearchText = HexColor("#46433C");
  static Color colorOrange = HexColor("#F36B21");
  static Color colorLightBlue = HexColor("#D1ECFF");
  static Color colorBorderBlue = HexColor("#6B8AFE");

  static Color colorCardYellow = HexColor("#E68702");
  static Color colorCardOrange = HexColor("#ED6048");
  static Color colorCardPurple = HexColor("#4D289B");
  static Color colorArrow = HexColor("#747478");
}
