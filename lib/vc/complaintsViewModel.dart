// @dart=2.9
//  核心：继承自ChangeNotifier
// 这种文件本来应该单独放在一个类文件连的
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComplaintsViewModel with ChangeNotifier {
  // String value = '';
  // void increment() {
  //   // value += 1;
  //   notifyListeners();
  // }
  String complaintedUserId;

  TextEditingController _remark;
  //发送消息
  Future<Map> sendMessage(Map arguments) async {
    Map reply = await messageChannel.send(arguments);
    return reply;
  }

  List<String> datas = [
    "none",
  ];

  static const messageChannel = const BasicMessageChannel(
      'flutter_and_native_getBillInfo', StandardMessageCodec());
//接收消息监听
  receiveMessage() {
    print("接收消息监听11");
    messageChannel.setMessageHandler((message) async {
      // setState(() {
      //   _nativeData = (message as Map)['count'];
      // });
      return message;
    });

    // messageChannel.setMessageHandler((message) => (

    // ));
    //  ((result) async {
    // print("Flutter 已收到消息11111");
    // print(result);
    // var _method = result["method"];
    // switch (_method) {
    //   case "img":
    //     this.clickAddImg(img: result["img"]);
    //     break;
    //   case "getComplaintedUserId":
    //     complaintedUserId = result["complaintedUserId"];
    //     break;
    //   default:
    // }
    // });
  }

  setId(userId) {
    print('setTmpValue(tmp)$userId');
    complaintedUserId = userId;
    // print('tmp====${tmp["version"]}');
    // 核心方法，通知刷新UI,调用build方法
    // notifyListeners();
  }

  flutterFromNativeValue() async {
    // this.datas.co
    var _data = new List<String>.from(this.datas);
    _data.remove("none");
    var _mapData = _data.map((e) => {"url": e}).toList();
    // print(this.datas.map((e) => {"url": e}));

    // /// 使用flutter boost 向iOS发送消息
    Map tmp = Map();
    tmp["url"] = "unauth/personal/save/user/complain";
    tmp["method"] = "request";
    tmp["req"] = {
      'remark': getRemark.text,
      'complaintedUserId': complaintedUserId,
      "attachs": _mapData
    };

    String jsonStringB = json.encode(tmp);
    // await sendMessage(jsonStringB);
    await messageChannel.send(jsonStringB);
  }

  clickChooseImg() async {
    Map<String, dynamic> tmp = Map<String, dynamic>();
    tmp["method"] = "img";
    await sendMessage(tmp);
  }

  clickAddImg({String img}) {
    // this.datas.add(img);
    this.datas.insert(0, img);
    print(this.datas);
    notifyListeners();
  }

  clickDelImg({int index}) {
    // this.datas.removeLast();
    this.datas.removeAt(index);
    print(this.datas);
    notifyListeners();
  }

  TextEditingController get getRemark {
    if (_remark == null) _remark = TextEditingController();
    return _remark;
  }
}
