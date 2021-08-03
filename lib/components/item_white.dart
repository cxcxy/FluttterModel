// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWhite extends StatefulWidget {
  ItemWhite({Key key, this.baseChild}) : super(key: key);
  final Widget baseChild;

  @override
  _ItemWhiteState createState() => _ItemWhiteState();
}

class _ItemWhiteState extends State<ItemWhite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: widget.baseChild),
    );
  }
}
