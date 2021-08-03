// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/vc/complaints.dart';
import 'package:provider/provider.dart';
import 'MyImage.dart';
import 'dart:core';

import 'complaintsViewModel.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class UploadView extends StatefulWidget {
  UploadView({Key key}) : super(key: key);

  @override
  _UploadViewState createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  // List<String> datas = [
  //   "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
  //   "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
  //   "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
  //   "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"
  // ];
  void _handleTapDown({int index}) {
    // print("点击了移除图片$img");
    // Provider.of<ComplaintsViewModel>(context).getRemark;

    // context.read<ComplaintsViewModel>().clickChooseImg();
    context.read<ComplaintsViewModel>().clickDelImg(index: index);
  }

  List<Widget> _getItemView() {
    var datas = context.watch<ComplaintsViewModel>().datas;
    // datas.add("1")
    print(datas);
    var list = datas.mapIndexed((value, index) {
      if (value == "none") {
        return UploadBtnView();
      }
      return GestureDetector(
          onTap: () {
            // print("onTap");
            this._handleTapDown(index: index);
          },
          child: Container(
            child: MyImage(
              imageProvider: NetworkImage(
                value,
              ),
            ),
          ));
    });

    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        children: _getItemView(),
      ),
    );
  }
}

class UploadBtnView extends StatefulWidget {
  UploadBtnView({Key key}) : super(key: key);

  @override
  _UploadBtnViewState createState() => _UploadBtnViewState();
}

class _UploadBtnViewState extends State<UploadBtnView> {
  void _handleTapDown(TapDownDetails details) {
    print("点击了上传图片");
    // Provider.of<ComplaintsViewModel>(context).getRemark;

    context.read<ComplaintsViewModel>().clickChooseImg();
    // context.read<ComplaintsViewModel>().clickAddImg();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
                color: Color.fromRGBO(228, 227, 227, 1), width: 0.5)),
        child: Container(
          // width: 77,
          // height: 77,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
            children: <Widget>[
              TextL(title: "+"),
              TextL(title: "上传照片"),
            ],
          ),
        ),
      ),
    );
  }
}
