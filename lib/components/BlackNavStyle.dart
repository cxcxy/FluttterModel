// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/colors.dart';

class BlackNavStyle extends StatefulWidget {
  BlackNavStyle({Key key, this.title, this.baseChild}) : super(key: key);
  final Widget baseChild;
  final String title;
  @override
  _BlackNavStyleState createState() => _BlackNavStyleState();
}

class _BlackNavStyleState extends State<BlackNavStyle> {
  void clickBack() {
    debugPrint("@22222");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0, //隐藏底部阴影分割线
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: goldenColor,
            ),
            onPressed: clickBack),
        title: Text(
          widget.title,
          style: TextStyle(color: goldenColor),
        ),
        backgroundColor: navBlackColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: navBlackColor),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: tableColor, borderRadius: BorderRadius.circular(20)),
          child: widget.baseChild,
        ),
      ),
    );
  }
}
