import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class XBToast {
  // 创造一个 单例
  factory XBToast() => _getInstance();
  static XBToast get instance => _getInstance();
  static XBToast? _instance;
  XBToast._internal() {
    // 初始化
  }
  static XBToast _getInstance() {
    if (_instance == null) {
      _instance = new XBToast._internal();
    }
    return _instance!;
  }

  showText(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
