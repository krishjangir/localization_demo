import 'package:flutter/material.dart';
import 'package:localization_demo/app/router/router.dart';
import 'package:localization_demo/app/widgets/text_widget.dart';

import '../res/app_size_config.dart';
import '../res/font_family.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onTap,
      this.borderColor,
      this.height,
      required this.backgroundColor})
      : super(key: key);

  final String? text;
  final Color color;
  final Color backgroundColor;
  final Color? borderColor;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: height ?? SizeConfig.size_50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor ?? backgroundColor),
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.size_25),
              )),
          margin: EdgeInsets.symmetric(vertical: SizeConfig.size_10),
          child: TextWidget(
            text: text,
            color: color,
            textAlign: TextAlign.center,
            fontWeight: FontStyles.semiBold,
            textSize: SizeConfig.font_16,
          )),
    );
  }
}

//BorderedButton
class BorderedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final String? buttonSubText;
  final Color borderColor;
  final Color buttonColor;
  final Color textColor;
  final Color subTextColor;
  final double minWidth;
  final double minHeight;
  final double radius;

  const BorderedButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      required this.buttonSubText,
      required this.borderColor,
      required this.buttonColor,
      this.minWidth = 240,
      this.minHeight = 27,
      this.radius = 5,
      required this.textColor,
      required this.subTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: minWidth,
        height: minHeight,
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: buttonColor,
            border:
                Border.all(color: borderColor, width: 1.5), // set border width
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: InkWell(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: buttonText,
                          style: TextStyle(
                              fontWeight: FontStyles.bold,
                              color: textColor,
                              fontSize: SizeConfig.font_18)),
                      TextSpan(
                          text: "  $buttonSubText",
                          style: TextStyle(
                              fontWeight: FontStyles.medium,
                              color: subTextColor,
                              fontSize: SizeConfig.font_16)),
                    ],
                  ),
                ),
              ],
            )));
  }
}
