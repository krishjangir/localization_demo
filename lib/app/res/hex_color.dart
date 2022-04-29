import 'dart:ui';

//This class is used to get color from hex color code
class HexColor extends Color {
  static int _getColorFromHex(String hexColorString) {
    var hexColor = hexColorString;
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
}
