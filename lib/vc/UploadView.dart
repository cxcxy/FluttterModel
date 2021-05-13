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

  List<Widget> _getItemView() {
    var datas = context.read<ComplaintsViewModel>().datas;
    print(datas);
    var list = datas.mapIndexed((value, index) {
      if (index == datas.length - 1) {
        return UploadBtnView();
      }
      return Container(
        child: MyImage(
          imageProvider: NetworkImage(
            value,
          ),
        ),
      );
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
