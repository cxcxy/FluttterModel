import 'dart:ui';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/2.0x/$name.$format';
  }

  static requestTask(String url, Map req) {
    // return 'images/2.0x/$name.$format';
    Map tmp = Map();
    tmp["url"] = url;
    tmp["method"] = "request";
    tmp["req"] = req;
  }
}

// {"reqtime":1621408465516,"requestId":"1621408465516E5YKtGrHbT","version":27,"privatefield":"wxSmallprogram/undefined","clientId":"pmi_wx_ma","clientType":"SmallApp","reqdata":{},"accessToken":"pmi_wx_ma/103964/29748425-7805-49be-b3e0-5c9e07de2e2f"}
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
