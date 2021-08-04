import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoImg extends StatefulWidget {
  PhotoImg(
      {Key? key,
      this.logo = 'https://f1.xb969.com/FkGevpIMkoZJ_tSA62El_kO61tcB',
      this.radius})
      : super(key: key);
  final String? logo;
  final double? radius;
  @override
  _PhotoImgState createState() => _PhotoImgState();
}

class _PhotoImgState extends State<PhotoImg> {
  @override
  Widget build(BuildContext context) {
    String _logo = widget.logo ?? "";
    return CircleAvatar(
      radius: widget.radius,
      backgroundColor: Colors.white,
      backgroundImage: NetworkImage(_logo == ""
          ? 'https://f1.xb969.com/FkGevpIMkoZJ_tSA62El_kO61tcB'
          : _logo),
    );
  }
}
