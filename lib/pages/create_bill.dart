import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_module/common/colors.dart';
import 'package:flutter_module/components/BlackNavStyle.dart';
import 'package:flutter_module/components/InputButtomWidget.dart';
import 'package:flutter_module/components/PhotoImg.dart';
import 'package:flutter_module/components/TextStyle.dart';
import 'package:flutter_module/components/bottom_btn.dart';
import 'package:flutter_module/components/item_white.dart';
import 'package:flutter_module/pages/goodsModel.dart';
import 'package:flutter_module/utils/utils.dart';
import 'package:flutter_module/vc/UploadView.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'goodsViewModel.dart';
import 'package:flutter_boost/flutter_boost.dart';

class GoodsMain extends StatelessWidget {
  // final Map<String, Object>? data;
  final String? data;
  const GoodsMain({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoodsViewModel(),
      child: CreateBillPage(
        data: this.data,
      ),
      // child: Center(
      //   child: Container(
      //     child: Text("${data ?? "12333"}"),
      //   ),
      // ),
    );
  }
}

class CreateBillPage extends StatefulWidget {
  final String? data;
  CreateBillPage({Key? key, this.data}) : super(key: key);

  @override
  _CreateBillPageState createState() => _CreateBillPageState();
}

class _CreateBillPageState extends State<CreateBillPage> {
  ///声明一个用来存回调的对象
  // VoidCallback? removeListener;
  // final controller = StreamController();
  @override
  void dispose() {
    context.read<GoodsViewModel>().dispose();
    super.dispose();
  }

  @override
  void initState() {
    // context.read<GoodsViewModel>().apiDemo(widget.data);
    context.read<GoodsViewModel>().configChannel();
    context.read<GoodsViewModel>().apiDemoWithFlutter(widget.data ?? "");

    super.initState();

    // ///添加事件响应者,监听native发往flutter端的事件
    // removeListener =
    //     BoostChannel.instance.addEventListener("event", (key, arguments) {
    //   ///deal with your event here
    //   print("key$key");
    //   print("flutter arguments$arguments");
    //   // context.read()
    //   // context.read<GoodsViewModel>().apiDemoResWithFlutter(arguments);
    //   context.read<GoodsViewModel>().apiDemo(arguments["resData"]);
    //   controller.sink.add('1');
    //   return;
    // });
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(   future: _calculation, // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数,
    // builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

    // })
    // return MainPage();
    return StreamBuilder(
      stream: context.read<GoodsViewModel>().controller.stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // switch (snapshot.connectionState)
        // ca
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("没有数据");

          case ConnectionState.waiting:
            // TODO: Handle this case.
            // return Center(
            //   child: Text("等待中数据"),
            // );
            return CupertinoActivityIndicator();
          // break;
          case ConnectionState.active:
            // TODO: Handle this case.
            return MainPage();
            break;
          case ConnectionState.done:
            // TODO: Handle this case.
            break;
        }
        return Container();
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlackNavStyle(
        title: '',
        baseChild: Container(
          decoration: BoxDecoration(color: navBlackColor),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: tableColor, borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 230,
                    // width: 100,
                    color: navBlackColor,
                  ),
                ),
                MainContent(),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      print("onPointerDownEvent");
                      Navigator.push(context, PopRoute(child: InputButtomWidget(
                        onEditingCompleteText: (text) {
                          print('点击发送 ---$text');
                          context.read<GoodsViewModel>().apiCommentAction(text);
                        },
                      )));
                    },
                    child: Container(
                      color: Colors.white,
                      // height: 60,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        padding: EdgeInsets.only(left: 15),
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: HexColor('#EDEDED'),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text999(
                            str: '说点什么吧',
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  bottom: 0,
                  left: 0,
                  right: 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  void initState() {
    // receiveMessage();
    // context.read<GoodsViewModel>().apiDemo();
    // flutterFromNativeValue();
    // print("initestatatatatat=======");
    // print(widget.params);
    // // context
    // //     .read<ComplaintsViewModel>()
    // //     .setId(widget.params["complaintedUserId"]);
    // //
    // if (widget.params != null) {
    //   var _id = widget.params["complaintedUserId"] ?? "103964";
    //   context.read<ComplaintsViewModel>().setId(_id);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final goodsDetail = Provider.of<GoodsViewModel>(context).goodsDetail;
    return Container(
      margin: EdgeInsets.fromLTRB(38, 0, 0, 0),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserInfoWidgt(),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(38, 0, 38, 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2 + goodsDetail.commentList.length,
                  // itemExtent: 50.0, //强制高度为50.0
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return GoodsInfos();
                    }
                    if (index == 1) {
                      return FirstComment();
                    }

                    return CommentItem(
                      commentItem: goodsDetail.commentList[index - 2],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FirstComment extends StatefulWidget {
  const FirstComment({
    Key? key,
  }) : super(key: key);

  @override
  _FirstCommentState createState() => _FirstCommentState();
}

class _FirstCommentState extends State<FirstComment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 18,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 5),
                padding: EdgeInsets.only(left: 15),
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: HexColor('#EDEDED'),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text999(
                    str: '说点什么吧',
                    fontSize: 13,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class GoodsInfos extends StatelessWidget {
  const GoodsInfos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goodsDetail = Provider.of<GoodsViewModel>(context).goodsDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HtmlContent(),
        AddressWidget(),
        Text999(
          str: '发布于 ${goodsDetail.fmtCreateDate}',
          fontSize: 12,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
          // color: Colors.green,
          child: Row(
            children: [
              Icon(Icons.favorite_border, size: 14),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text333(
                    str: '${goodsDetail.likeCount}人喜欢',
                    fontSize: 14,
                  ),
                ),
              ),
              LikeListWidget(goodsDetail: goodsDetail)
            ],
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Text333(
            str: '评论（${goodsDetail.commentCount}）',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class LikeListWidget extends StatefulWidget {
  const LikeListWidget({
    Key? key,
    required this.goodsDetail,
  }) : super(key: key);

  final Welcome goodsDetail;

  @override
  _LikeListWidgetState createState() => _LikeListWidgetState();
}

class _LikeListWidgetState extends State<LikeListWidget> {
  @override
  Widget build(BuildContext context) {
    List<LikeList> likeList = widget.goodsDetail.likeList;
    if (likeList.length == 0) {
      return Container();
    }
    if (likeList.length == 1) {
      return PhotoImg(
        radius: 15,
        logo: likeList[0].userLogo,
      );
    }
    if (likeList.length == 2) {
      return Wrap(
        spacing: -8.0,
        children: [
          PhotoImg(
            radius: 15,
            logo: likeList[0].userLogo,
          ),
          PhotoImg(
            radius: 15,
            logo: likeList[1].userLogo,
          ),
        ],
      );
    }
    return Wrap(
      spacing: -8.0,
      children: [
        PhotoImg(
          radius: 15,
          logo: likeList[0].userLogo,
        ),
        PhotoImg(
          radius: 15,
          logo: likeList[1].userLogo,
        ),
        PhotoImg(
          radius: 15,
          logo: likeList[2].userLogo,
        ),
      ],
    );
  }
}

class CommentItem extends StatefulWidget {
  final CommentList? commentItem;
  const CommentItem({
    Key? key,
    this.commentItem,
  }) : super(key: key);

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.amberAccent,
            radius: 18,
            backgroundImage: NetworkImage(widget.commentItem?.userLogo ?? ""),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text333(
                    str: "${widget.commentItem?.displayName ?? ""}",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text999(
                      str: '${widget.commentItem?.fmtContentDate ?? ""}',
                      fontSize: 13,
                    ),
                  ),
                  Text333(
                    str: '${widget.commentItem?.content ?? ""}',
                    fontSize: 13,
                  ),
                  Divider()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoWidgt extends StatefulWidget {
  const UserInfoWidgt({
    Key? key,
  }) : super(key: key);

  @override
  _UserInfoWidgtState createState() => _UserInfoWidgtState();
}

class _UserInfoWidgtState extends State<UserInfoWidgt> {
  @override
  Widget build(BuildContext context) {
    final goodsDetail = Provider.of<GoodsViewModel>(context).goodsDetail;
    return Container(
      height: 100,
      color: navBlackColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.amberAccent,
            radius: 30,
            backgroundImage: NetworkImage(goodsDetail.createUserLogo),
            // child: CachedNetworkImage(
            //   imageUrl: goodsDetail.createUserLogo,
            //   fit: BoxFit.cover,
            //   cacheKey: goodsDetail.createUserLogo,
            //   // key: widget.key,
            // ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      '${goodsDetail.createUserDispname}',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        color: HexColor("#FDE1B6"),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '${goodsDetail.createUserProfile}',
                    style: TextStyle(
                      color: HexColor("#FDE1B6"),
                      fontSize: 12,
                      // fontFamily:
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 38),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: HexColor("#786448"),
            ),
            width: 80,
            height: 25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 12,
                  color: Colors.white,
                ),
                Text(
                  '喜欢',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddressWidget extends StatefulWidget {
  const AddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    final goodsDetail = Provider.of<GoodsViewModel>(context).goodsDetail;
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      height: 60,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: HexColor('#F2F2F2'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Text333(
              str: goodsDetail.companyName,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 12,
                ),
                Text333(
                  str:
                      '${goodsDetail.companyArea}${goodsDetail.companyAddress}',
                  fontSize: 12,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HtmlContent extends StatefulWidget {
  final String? htmlStr;
  HtmlContent({Key? key, this.htmlStr}) : super(key: key);

  @override
  _HtmlContentState createState() => _HtmlContentState();
}

class _HtmlContentState extends State<HtmlContent> {
  @override
  Widget build(BuildContext context) {
    final goodsDetail = Provider.of<GoodsViewModel>(context).goodsDetail;
    return Html(
      // data: """<div>
      //   <h1>Demo Page</h1>
      //   <p>This is a fantastic product that you should buy!</p>
      //   <h3>Features</h3>
      //   <ul>
      //     <li>It actually works</li>
      //     <li>It exists</li>
      //     <li>It doesn't cost much!</li>
      //   </ul>
      //   <!--You can pretty much put any html in here!-->
      // </div>""",
      data: goodsDetail.productDetails,
    );
  }
}
