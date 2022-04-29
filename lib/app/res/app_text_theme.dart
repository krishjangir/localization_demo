
import 'package:flutter/material.dart';

import 'font_family.dart';

class AppTextTheme{
  AppTextTheme._();

  //textTheme
  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: FontFamily.appFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: Colors.black,
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: FontFamily.appFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: Colors.black87,
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: FontFamily.appFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: Colors.black,
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: FontFamily.appFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: Colors.black,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: FontFamily.appFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: Colors.black,
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: FontFamily.appFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: Colors.black,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: FontFamily.appFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: Colors.black,
  );
}
