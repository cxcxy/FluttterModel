// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoImg extends StatefulWidget {
  PhotoImg(
      {Key key,
      this.logo =
          'https://f1.xb969.com/FnjvZEd3_9-WzqL-YCk7tnywyHSe?imageMogr2/auto-orient'})
      : super(key: key);
  final String logo;
  @override
  _PhotoImgState createState() => _PhotoImgState();
}

class _PhotoImgState extends State<PhotoImg> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(widget.logo),
    );
  }
}
