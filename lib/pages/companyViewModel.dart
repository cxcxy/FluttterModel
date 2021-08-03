// @dart=2.9
//  核心：继承自ChangeNotifier
// 这种文件本来应该单独放在一个类文件连的
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CompanyViewModel with ChangeNotifier {
  Map companyDetail = {};

  List productList = [];

  Map orderStats = {};

  dynamic getValue(key) {
    if (this.companyDetail.isNotEmpty) {
      return companyDetail[key];
    }
    return '';
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

  apiDemo() async {
    //1. 读取json文件
    String jsonString = await rootBundle.loadString("images/company.json");
    print("jsonString===");
    this.companyDetail = json.decode(jsonString);

    this.productList = this.getValue("productList");

    this.orderStats = this.getValue("orderStats");

    print(this.productList);
    notifyListeners();
    // return Api.reqeustPost("public/mall/goods/getdetailbygoodsid", params);
  }
}
