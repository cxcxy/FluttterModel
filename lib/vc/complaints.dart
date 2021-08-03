// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/colors.dart';
import 'package:flutter_module/components/item_white.dart';
import 'package:provider/provider.dart';

import 'UploadView.dart';
import 'complaintsViewModel.dart';

class ComplaintsMain extends StatelessWidget {
  ComplaintsMain({this.params});
  final Map params;
  @override
  Widget build(BuildContext context) {
    print("ComplaintsMainparams=======$params");
    return ChangeNotifierProvider(
      create: (context) => ComplaintsViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ComplaintsPage(params: params),
      ),
    );
  }
}

class ComplaintsPage extends StatefulWidget {
  ComplaintsPage({Key key, this.params}) : super(key: key);
  final Map params;
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  void clickBack() {
    debugPrint("@22222");
  }

  @override
  void initState() {
    // receiveMessage();
    context.read<ComplaintsViewModel>().receiveMessage();
    // flutterFromNativeValue();
    print("initestatatatatat=======");
    print(widget.params);
    // context
    //     .read<ComplaintsViewModel>()
    //     .setId(widget.params["complaintedUserId"]);
    //
    if (widget.params != null) {
      var _id = widget.params["complaintedUserId"] ?? "103964";
      context.read<ComplaintsViewModel>().setId(_id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: goldenColor,
            ),
            onPressed: clickBack),
        title: Text(
          '投诉',
          style: TextStyle(color: goldenColor),
        ),
        backgroundColor: navBlackColor,
      ),
      body: Container(
        decoration: BoxDecoration(color: navBlackColor),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: tableColor, borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: ItemWhite(
                  baseChild: InputAttachs(),
                ),
              ),
              Align(alignment: Alignment.bottomCenter, child: BottomBtn())
            ],
          ),
        ),
      ),
    );
  }
}

class InputAttachs extends StatefulWidget {
  InputAttachs({Key key}) : super(key: key);

  @override
  _InputAttachsState createState() => _InputAttachsState();
}

class _InputAttachsState extends State<InputAttachs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 115,
              color: Color.fromRGBO(242, 242, 242, 1),
              margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Consumer<ComplaintsViewModel>(
                builder: (context, model, child) => TextField(
                  maxLines: null,
                  controller:
                      Provider.of<ComplaintsViewModel>(context).getRemark,
                  decoration: InputDecoration(
                      hintText: "请输入投诉理由……",
                      hintStyle: TextStyle(color: placeHolderColor),
                      border: InputBorder.none),
                ),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: AttachsView(),
          )
        ],
      ),
    );
  }
}

// class UploadBtnView extends StatelessWidget {
//   void _handleTapDown(TapDownDetails details) {
//     print("点击了上传图片");
//     // Provider.of<ComplaintsViewModel>(context).getRemark;

//     // context.read<ComplaintsViewModel>().flutterFromNativeValue();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class TextL extends StatefulWidget {
  TextL({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TextLState createState() => _TextLState();
}

class _TextLState extends State<TextL> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.title,
        style: TextStyle(
          color: placeHolderColor,
          fontSize: 12,
        ),
      ),
    );
  }
}

class AttachsView extends StatefulWidget {
  AttachsView({Key key}) : super(key: key);

  @override
  _AttachsViewState createState() => _AttachsViewState();
}

class _AttachsViewState extends State<AttachsView> {
  @override
  Widget build(BuildContext context) {
    return UploadView();
  }
}

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
    print("点击了确认");
    print(context.read<ComplaintsViewModel>().getRemark.text);
    context.read<ComplaintsViewModel>().flutterFromNativeValue();
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
