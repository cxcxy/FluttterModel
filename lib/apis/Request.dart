// import 'Api.dart';
import 'package:flutter_boost/flutter_boost.dart';

class Request {
  requestBaseTarget(String url, Map req) async {
    Map tmp = Map();
    tmp["url"] = url;
    tmp["method"] = "request";
    tmp["req"] = req;
    BoostChannel.instance.sendEventToNative("requestToNative", tmp);
  }
}
