import 'package:flutter/material.dart';

import '../res/font_family.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.text,
      this.textSize = 12,
      this.height = 1.2,
      this.padding = const EdgeInsets.all(0.0),
      this.color = Colors.black,
      this.backgroundColor = Colors.transparent,
      this.fontWeight = FontStyles.regular,
      this.textAlign = TextAlign.start,
      this.fontFamily = FontStyles.appFontFamily,
      this.fontStyle = FontStyle.normal,
      this.textDecoration = TextDecoration.none,
      this.textOverflow})
      : super(key: key);

  final String? text;
  final double textSize;
  final double height;
  final EdgeInsets padding;
  final Color color;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final String? fontFamily;
  final TextDecoration textDecoration;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding,
      child: Text(
        text??'',
        style: TextStyle(
          overflow: textOverflow,
          decoration: textDecoration,
          fontSize: textSize,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          height: height,
          fontFamily: fontFamily,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
