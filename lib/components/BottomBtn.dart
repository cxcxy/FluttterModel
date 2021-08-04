// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/colors.dart';

class BottomBtn extends StatefulWidget {
  BottomBtn({Key key}) : super(key: key);

  @override
  _BottomBtnState createState() => _BottomBtnState();
}

class _BottomBtnState extends State<BottomBtn> {
  void _handleTapDown(TapDownDetails details) {
    // //定义点击函数
    // setState(() {
    //   // _highlight = true; //手指按下时将_highlight设置为true
    // });
    // print("点击了确认");
    // print(context.read<ComplaintsViewModel>().getRemark.text);
    // context.read<ComplaintsViewModel>().flutterFromNativeValue();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTapDown: _handleTapDown, // 分析 1
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          height: 60,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Color.fromRGBO(51, 51, 51, 1),
                borderRadius: BorderRadius.circular(5)),
            child: Container(
              width: double.infinity,
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '确认',
                    style: TextStyle(
                      color: goldenColor,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          // ),
        ),
      ),
    );
  }
}
