// @dart=2.9
//  核心：继承自ChangeNotifier
// 这种文件本来应该单独放在一个类文件连的
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'goodsModel.dart';

class GoodsViewModel with ChangeNotifier {
  Welcome goodsDetail = Welcome();

  List productList = [];

  Map orderStats = {};

  static const messageChannel = const BasicMessageChannel(
      'flutter_and_native_getBillInfo', StandardMessageCodec());

  // final controller = StreamController();

  dynamic getValue(key) {
    // if (this.goodsDetail.isNotEmpty) {
    //   return goodsDetail[key];
    // }
    // return '';
  }

//接收消息监听
  receiveMessage() {}

  setId(userId) {}

  flutterFromNativeValue() async {}

  clickChooseImg() async {}

  clickAddImg({String img}) {}

  clickDelImg({int index}) {}

  int getOrderCount(String key) {
    print(key);
    // this.orderStats = this.getValue("orderStats");
    print(this.orderStats);
    if (this.orderStats.isNotEmpty) {
      return this.orderStats[key] | 0;
    }
    return 0;
  }

  apiDemo(String dic) async {
    print('apiDemo$dic');

    // var _mapData = _data.map((e) => {"url": e}).toList();
    // print(this.datas.map((e) => {"url": e}));

    // /// 使用flutter boost 向iOS发送消息

    // Map tmp = Map();
    // tmp["url"] = "unauth/personal/save/user/complain";
    // tmp["method"] = "request";
    // tmp["req"] = {
    //   'recommendId': 55,
    // };

    // String jsonStringB = json.encode(tmp);

    // await messageChannel.send(jsonStringB);

    //1. 读取json文件

    // String jsonString = await rootBundle.loadString("images/goods.json");

    String jsonString = dic;
    this.goodsDetail = welcomeFromJson(jsonString);

    print('this.goodsDetail.companyName${this.goodsDetail}');
    Future<void>.delayed(Duration.zero, () {
      print("Future.delayed Event");
      notifyListeners();
    });
  }

  apiDemoWithFlutter(String recommendId) async {
    // http://192.168.11.45:8082/pmiapi/unauth/recommendprod/productdetail?1627970591561NDHsz7D4yQ
    Map tmp = Map();
    tmp["url"] = "pmiapi/unauth/recommendprod/productdetail";
    tmp["method"] = "request";
    tmp["req"] = {
      'recommendId': recommendId,
    };
    // String jsonStringB = json.encode(tmp);
    // await messageChannel.send(jsonStringB);
    BoostChannel.instance.sendEventToNative("eventToNative", tmp);
  }

  apiDemoResWithFlutter(Map map) async {
    print("apiDemoResWithFlutter -- map ${map.toString()}");

    // this.goodsDetail = welcomeFromMapJson(map);
    this.goodsDetail = welcomeFromJson(map.toString());
    print('this.goodsDetail.apiDemoResWithFlutter${this.goodsDetail}');
    Future<void>.delayed(Duration.zero, () {
      print("Future.delayed Event apiDemoResWithFlutter");
      notifyListeners();
    });
  }
}
