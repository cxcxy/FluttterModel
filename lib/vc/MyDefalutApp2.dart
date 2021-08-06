import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/boost_navigator.dart';

class BasicMessageChannelDemo extends StatefulWidget {
  @override
  _BasicMessageChannelDemoState createState() =>
      _BasicMessageChannelDemoState();
}

class _BasicMessageChannelDemoState extends State<BasicMessageChannelDemo> {
  // var channel =
  //     BasicMessageChannel('BasicMessageChannel', StandardMessageCodec());
  //
  //
  //
  //
  static const messageChannel = const BasicMessageChannel(
      'flutter_and_native_100', StandardMessageCodec());
  static const platform = const MethodChannel('BasicMessageChannel');

  //发送消息
  Future<SendObj> sendMessage(SendObj arguments) async {
    SendObj? reply = (await messageChannel.send(arguments)) as SendObj?;
    //解析 原生发给 Flutter 的参数
    int _code = reply?.code ?? 0;
    String message = reply?.ontent ?? "";

    //更新 Flutter 中页面显示
    // setState(() {
    //   recive = "code:$code message:$message";
    // });
    return reply!;
  }

  var _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            child: Text('调用原生方法'),
            onPressed: () async {
              var result = await platform.invokeMethod('getBatteryLevel');
              var name = result['name'];
              var age = result['age'];
              setState(() {
                _data = '$name,$age';
              });
            },
          ),
          RaisedButton(
            child: Text('发送数据到原生'),
            onPressed: () async {
              // var result = await platform.invokeMethod('getBatteryLevel');
              // var name = result['name'];
              // var age = result['age'];
              // setState(() {
              //   _data = '$name,$age';
              // });
              //用来实现 Android iOS 主动触发 向 Flutter 中发送消息
              // await sendMessage(
              //     {"method": "test2", "ontent": "flutter 中的数据", "code": 100});
            },
          ),
          Text('原生返回数据：$_data'),
        ],
      ),
    );
  }
}

class SendObj {
  SendObj({
    this.code,
    this.method,
    this.ontent,
  });

  int? code;
  String? method;
  String? ontent;

  factory SendObj.fromJson(Map<String, dynamic> json) => SendObj(
        code: json["code"],
        method: json["method"],
        ontent: json["ontent"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "method": method,
        "ontent": ontent,
      };
}
