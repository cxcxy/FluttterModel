// import 'Api.dart';
import 'package:flutter_boost/flutter_boost.dart';

class Request {
  // 创造一个 单例
  factory Request() => _getInstance();
  static Request get instance => _getInstance();
  static Request? _instance;
  Request._internal() {
    // 初始化
  }
  static Request _getInstance() {
    if (_instance == null) {
      _instance = new Request._internal();
    }
    return _instance!;
  }

  requestBaseTarget(String url, Map req) async {
    Map tmp = Map();
    tmp["url"] = url;
    tmp["method"] = "request";
    tmp["req"] = req;
    BoostChannel.instance.sendEventToNative("requestToNative", tmp);
  }
}
