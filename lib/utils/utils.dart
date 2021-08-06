import 'dart:ui';
// export 'navigator_util.dart';
// export 'utils.dart';
// export 'http_utils.dart';
/// 工具类 三方库
export 'package:common_utils/common_utils.dart';
export 'package:flustars/flustars.dart';
// export 'package:fluintl/fluintl.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/2.0x/$name.$format';
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
