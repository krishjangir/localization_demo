import 'package:flutter/widgets.dart';

//This class is used to handle dimensions for app using MediaQuery for variable size according to screens
class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double pixelRatio;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  // FONT SIZE
  static late double smallerFontSize = 10.0;
  static late double standardFontSize = 14.0;
  static late double biggerFontSize = 18.0;
  static late double display1FontSize = 36.0;
  static late double headlineFontSize = 24.0;
  static late double titleFontSize = 16.0;
  static late double subTitleFontSize = 14.0;
  static late double body1FontSize = 16.0;
  static late double body2FontSize = 14.0;
  static late double captionFontSize = 12.0;

  // PADDING
  static late double smallerPadding;
  static late double standardPadding;
  static late double biggerPadding;

  // ELEVATION
  static double standardElevation = 0.0;

  //sizes for all screens
  static late double size_1;
  static late double size_2;
  static late double size_3;
  static late double size_4;
  static late double size_5;
  static late double size_6;
  static late double size_7;
  static late double size_8;
  static late double size_9;
  static late double size_10;
  static late double size_12;
  static late double size_12_5;
  static late double size_14;
  static late double size_15;
  static late double size_16;
  static late double size_18;
  static late double size_20;
  static late double size_22;
  static late double size_24;
  static late double size_25;
  static late double size_26;
  static late double size_28;
  static late double size_30;
  static late double size_32;
  static late double size_34;
  static late double size_36;
  static late double size_37_5;
  static late double size_40;
  static late double size_42;
  static late double size_45;
  static late double size_50;
  static late double size_54;
  static late double size_56;
  static late double size_60;
  static late double size_65;
  static late double size_70;
  static late double size_75;
  static late double size_80;
  static late double size_85;
  static late double size_90;
  static late double size_95;
  static late double size_100;
  static late double size_120;
  static late double size_125;
  static late double size_130;
  static late double size_140;
  static late double size_150;
  static late double size_160;
  static late double size_180;
  static late double size_200;
  static late double size_220;
  static late double size_240;
  static late double size_230;
  static late double size_250;
  static late double size_280;
  static late double size_290;
  static late double size_300;
  static late double size_340;
  static late double size_320;
  static late double size_360;
  static late double size_380;
  static late double size_400;
  static late double size_420;
  static late double size_440;
  static late double size_460;
  static late double size_480;
  static late double size_500;
  static late double size_540;
  static late double size_560;
  static late double size_580;

  //fonts sizes for all screens
  static late double font_10;
  static late double font_12;
  static late double font_14;
  static late double font_16;
  static late double font_18;
  static late double font_20;
  static late double font_24;
  static late double font_28;
  static late double font_32;
  static late double font_36;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    pixelRatio = _mediaQueryData!.devicePixelRatio;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    double? deviceWidth =
        (MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.shortestSide
            : MediaQuery.of(context).size.longestSide);

    if (deviceWidth >= 950) {
      safeBlockHorizontal = safeBlockHorizontal * 0.4;
    } else if (deviceWidth >= 600) {
      safeBlockHorizontal = safeBlockHorizontal * 0.85;
    }

    //sizes for all screens
    size_1 = safeBlockHorizontal * 0.25;
    size_2 = safeBlockHorizontal * 0.5;
    size_3 = safeBlockHorizontal * 0.75;
    size_4 = safeBlockHorizontal * 1;
    size_5 = safeBlockHorizontal * 1.25;
    size_6 = safeBlockHorizontal * 1.5;
    size_7 = safeBlockHorizontal * 1.75;
    size_8 = safeBlockHorizontal * 2.0;
    size_9 = safeBlockHorizontal * 2.25;
    size_10 = safeBlockHorizontal * 2.5;
    size_12 = safeBlockHorizontal * 3;
    size_12_5 = safeBlockHorizontal * 3.125;
    size_14 = safeBlockHorizontal * 3.5;
    size_15 = safeBlockHorizontal * 3.75;
    size_16 = safeBlockHorizontal * 4;
    size_18 = safeBlockHorizontal * 4.5;
    size_20 = safeBlockHorizontal * 5;
    size_22 = safeBlockHorizontal * 5.5;
    size_24 = safeBlockHorizontal * 6;
    size_25 = safeBlockHorizontal * 6.25;
    size_26 = safeBlockHorizontal * 6.5;
    size_28 = safeBlockHorizontal * 7;
    size_30 = safeBlockHorizontal * 7.5;
    size_32 = safeBlockHorizontal * 8;
    size_34 = safeBlockHorizontal * 8.5;
    size_36 = safeBlockHorizontal * 9;
    size_37_5 = safeBlockHorizontal * 9.36;
    size_40 = safeBlockHorizontal * 10;
    size_42 = safeBlockHorizontal * 10.5;
    size_45 = safeBlockHorizontal * 11.25;
    size_50 = safeBlockHorizontal * 12.5;
    size_54 = safeBlockHorizontal * 13.5;
    size_56 = safeBlockHorizontal * 14;
    size_60 = safeBlockHorizontal * 15;
    size_65 = safeBlockHorizontal * 16.25;
    size_70 = safeBlockHorizontal * 17.5;
    size_75 = safeBlockHorizontal * 18.75;
    size_80 = safeBlockHorizontal * 20;
    size_85 = safeBlockHorizontal * 21.25;
    size_90 = safeBlockHorizontal * 22.5;
    size_95 = safeBlockHorizontal * 23.75;
    size_100 = safeBlockHorizontal * 25;
    size_120 = safeBlockHorizontal * 30;
    size_125 = safeBlockHorizontal * 31.25;
    size_130 = safeBlockHorizontal * 32.5;
    size_140 = safeBlockHorizontal * 35;
    size_150 = safeBlockHorizontal * 37.5;
    size_160 = safeBlockHorizontal * 40;
    size_180 = safeBlockHorizontal * 45;
    size_200 = safeBlockHorizontal * 50;
    size_220 = safeBlockHorizontal * 55;
    size_230 = safeBlockHorizontal * 57.5;
    size_240 = safeBlockHorizontal * 60;
    size_250 = safeBlockHorizontal * 62.5;
    size_280 = safeBlockHorizontal * 70;
    size_290 = safeBlockHorizontal * 72.5;
    size_300 = safeBlockHorizontal * 75;
    size_320 = safeBlockHorizontal * 80;
    size_340 = safeBlockHorizontal * 85;
    size_360 = safeBlockHorizontal * 90;
    size_380 = safeBlockHorizontal * 95;
    size_400 = safeBlockHorizontal * 100;
    size_420 = safeBlockHorizontal * 105;
    size_440 = safeBlockHorizontal * 110;
    size_460 = safeBlockHorizontal * 115;
    size_480 = safeBlockHorizontal * 120;
    size_500 = safeBlockHorizontal * 125;
    size_540 = safeBlockHorizontal * 135;
    size_560 = safeBlockHorizontal * 140;
    size_580 = safeBlockHorizontal * 145;

    //fonts sizes for all screens
    font_10 = safeBlockHorizontal * 2.5;
    font_12 = safeBlockHorizontal * 3;
    font_14 = safeBlockHorizontal * 3.5;
    font_16 = safeBlockHorizontal * 4;
    font_18 = safeBlockHorizontal * 4.5;
    font_20 = safeBlockHorizontal * 5;
    font_24 = safeBlockHorizontal * 6;
    font_28 = safeBlockHorizontal * 7;
    font_32 = safeBlockHorizontal * 8;
    font_36 = safeBlockHorizontal * 9;

    //STANDARD FONT SIZE
    smallerFontSize = font_10;
    standardFontSize = font_14;
    biggerFontSize = font_18;
    display1FontSize = font_36;
    headlineFontSize = font_24;
    titleFontSize = font_16;
    subTitleFontSize = font_14;
    body1FontSize = font_16;
    body2FontSize = font_14;
    captionFontSize = font_12;

    // PADDING
    smallerPadding = size_8;
    standardPadding = size_16;
    biggerPadding = size_24;

    // ELEVATION
    standardElevation = size_3;
  }
}
