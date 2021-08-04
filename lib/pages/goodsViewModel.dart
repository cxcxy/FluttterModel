//  核心：继承自ChangeNotifier
// 这种文件本来应该单独放在一个类文件连的
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/apis/Api.dart';
import 'package:flutter_module/apis/Request.dart';
import 'package:flutter_module/utils/Toast.dart';
import 'goodsModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GoodsViewModel with ChangeNotifier {
  Welcome goodsDetail = Welcome();

  String? recommendId;

  ///声明一个用来存回调的对象
  VoidCallback? removeListener1;

  final controller = StreamController();

  @override
  void dispose() {
    ///记得解除注册
    removeListener1?.call();
    controller.close();
    super.dispose();
  }

  configChannel() {
    ///添加事件响应者,监听native发往flutter端的事件
    this.removeListener1 =
        BoostChannel.instance.addEventListener("event", (key, arguments) {
      String _url = arguments["url"];
      int _code = arguments["code"];
      String? _msg = arguments["message"];
      if (_code == 2000) {
        XBToast.instance.showText(_msg ?? "请求错误");
        return;
      }
      if (_url == Api.recommendprodCreatecomment ||
          _url == Api.recommendprodLikeproduct ||
          _url == Api.recommendprodLikecomment) {
        requestRecommendGoodsDetail(this.recommendId ?? "");
      } else {
        getRecommendGoodsDetailData(arguments["resData"]);
      }

      controller.sink.add('1');
      return;
    });
  }

  /// 获取 推荐商品详情 Data
  getRecommendGoodsDetailData(String dic) async {
    print('apiDemo$dic');
    String jsonString = dic;
    this.goodsDetail = welcomeFromJson(jsonString);

    // print('this.goodsDetail.companyName${this.goodsDetail}');
    Future<void>.delayed(Duration.zero, () {
      // print("Future.delayed Event");
      notifyListeners();
    });
  }

  /// 请求 推荐商品详情
  requestRecommendGoodsDetail(String recommendId) async {
    this.recommendId = recommendId;
    Request.instance.requestBaseTarget(Api.recommendprodProductDetail, {
      'recommendId': recommendId,
    });
  }

  /// 提交评论
  requestCommitComment(String content) async {
    Request.instance.requestBaseTarget(Api.recommendprodCreatecomment,
        {'recommendId': this.recommendId, 'content': content});
  }

  /// 请求喜欢接口
  requestLikeGoodsStatus() async {
    int operType = this.goodsDetail.likeStatus ? 2 : 1;
    Request.instance.requestBaseTarget(Api.recommendprodLikeproduct,
        {'recommendId': this.recommendId, 'operType': operType});
  }

  /// 请求点赞评论接口
  requestLikeCommentStatus(int commentId) async {
    Request.instance.requestBaseTarget(
        Api.recommendprodLikecomment, {'commentId': commentId});
  }
}
