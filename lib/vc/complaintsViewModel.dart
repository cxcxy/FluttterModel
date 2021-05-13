//  核心：继承自ChangeNotifier
// 这种文件本来应该单独放在一个类文件连的
import 'package:flutter/cupertino.dart';
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
    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
  ];

  static const messageChannel = const BasicMessageChannel(
      'flutter_and_native_getBillInfo', StandardMessageCodec());
//接收消息监听
  receiveMessage() {
    print("接收消息监听11");
    messageChannel.setMessageHandler((result) async {
      print("Flutter 已收到消息11111");
      print(result);
      complaintedUserId = result["complaintedUserId"];
      // return 'Flutter 已收到消息';
    });
  }

  setId(userId) {
    print('setTmpValue(tmp)$userId');
    complaintedUserId = userId;
    // print('tmp====${tmp["version"]}');
    // 核心方法，通知刷新UI,调用build方法
    // notifyListeners();
  }

  flutterFromNativeValue() async {
    /// 使用flutter boost 向iOS发送消息
    Map<String, dynamic> tmp = Map<String, dynamic>();
    tmp["url"] = "unauth/personal/save/user/complain";
    tmp["req"] = {
      'remark': getRemark.text,
      'complaintedUserId': complaintedUserId
    };
    await sendMessage(tmp);
  }

  clickChooseImg() async {
    Map<String, dynamic> tmp = Map<String, dynamic>();
    tmp["method"] = "img";
    await sendMessage(tmp);
  }

  clickAddImg() {
    this
        .datas
        .add("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4");
    print(this.datas);
    notifyListeners();
  }

  TextEditingController get getRemark {
    if (_remark == null) _remark = TextEditingController();
    return _remark;
  }
}
