import 'package:flutter/cupertino.dart';
import 'package:flutter_module/utils/utils.dart';

class XBText extends StatefulWidget {
  final String? str;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  XBText({Key? key, this.str, this.color, this.fontSize, this.fontWeight})
      : super(key: key);

  @override
  _XBTextState createState() => _XBTextState();
}

class _XBTextState extends State<XBText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.str!,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
      ),
    );
  }
}

// 文本颜色 - #333333
class Text333 extends StatefulWidget {
  final String? str;
  final double? fontSize;
  final FontWeight? fontWeight;
  Text333({Key? key, this.str = "", this.fontSize, this.fontWeight})
      : super(key: key);

  @override
  _Text333State createState() => _Text333State();
}

class _Text333State extends State<Text333> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.str!,
      style: TextStyle(
        color: HexColor("#333333"),
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
      ),
    );
  }
}

// 文本颜色 - #999999
class Text999 extends StatefulWidget {
  final String? str;
  final double? fontSize;
  final FontWeight? fontWeight;
  Text999({Key? key, this.str = "", this.fontSize, this.fontWeight})
      : super(key: key);

  @override
  _Text999State createState() => _Text999State();
}

class _Text999State extends State<Text999> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.str!,
      style: TextStyle(
        color: HexColor("#999999"),
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
      ),
    );
  }
}
