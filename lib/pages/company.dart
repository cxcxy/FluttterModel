// @dart=2.9
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/colors.dart';
import 'package:flutter_module/components/BlackNavStyle.dart';
import 'package:flutter_module/components/PhotoImg.dart';
import 'package:flutter_module/components/item_white.dart';
import 'package:flutter_module/utils/utils.dart';
import 'package:flutter_module/vc/MyImage.dart';
import 'package:flutter_module/vc/UploadView.dart';
import 'package:flutter_module/vc/complaints.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'companyViewModel.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompanyViewModel(),
      child: CompanyPageChild(),
    );
  }
}

class CompanyPageChild extends StatefulWidget {
  CompanyPageChild({Key key}) : super(key: key);

  @override
  _CompanyPageChildState createState() => _CompanyPageChildState();
}

class _CompanyPageChildState extends State<CompanyPageChild> {
  void clickBack() {}
  @override
  void initState() {
    // receiveMessage();
    context.read<CompanyViewModel>().apiDemo();
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
    return Container(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: goldenColor,
            ),
            onPressed: clickBack,
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    // "images/2.0x/zhuanhuan@2x.png",
                    Utils.getImgPath("zhuanhuan@2x"),
                    width: 30,
                    height: 30,
                  ),
                )),
          ],
          elevation: 0,
          // title: Text("Title"),
        ),
        body: CompanyContent(),
      ),
    );
  }
}

// class CompanyPage extends StatefulWidget {
//   CompanyPage({Key key}) : super(key: key);

//   @override
//   _CompanyPageState createState() => _CompanyPageState();
// }

// class _CompanyPageState extends State<CompanyPage> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CompanyViewModel(),
//       child:

//     );
//   }

//   void clickBack() {}
// }

class CompanyContent extends StatefulWidget {
  CompanyContent({Key key}) : super(key: key);

  @override
  _CompanyContentState createState() => _CompanyContentState();
}

class _CompanyContentState extends State<CompanyContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        CompanyUserInfo(),
        Positioned(
          top: 250,
          left: 0,
          right: 0,
          bottom: 0,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                width: double.infinity, // set this
                child: Column(
                  children: [
                    ItemWhiteShadow(
                      child: OperationItem(
                        type: 0,
                      ),
                    ),
                    ItemWhiteShadow(
                      child: Column(
                        children: [
                          Container(
                            height: 45,
                            // color: Colors.red,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(15, 12, 0, 15),
                                    child: Text('订单管理',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1))),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 12, 15, 15),
                                  child: Text(
                                    '更多>',
                                    style: TextStyle(
                                        fontSize: 13, color: color153),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, indent: 0.0, color: colorLine),
                          OperationItem(
                            type: 1,
                          ),
                        ],
                      ),
                    ),
                    ItemWhiteShadow(
                      child: Column(
                        children: [
                          Container(
                            height: 45,
                            // color: Colors.red,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(15, 12, 0, 15),
                                    child: Text('商品管理',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1))),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 12, 15, 15),
                                  child: Text(
                                    '更多>',
                                    style: TextStyle(
                                        fontSize: 13, color: color153),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, indent: 0.0, color: colorLine),
                          Container(
                            height: 160,
                            margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: GoodsList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}

class CompanyUserInfo extends StatefulWidget {
  CompanyUserInfo({Key key}) : super(key: key);

  @override
  _CompanyUserInfoState createState() => _CompanyUserInfoState();
}

class _CompanyUserInfoState extends State<CompanyUserInfo> {
  @override
  Widget build(BuildContext context) {
    final copanyViewModel = Provider.of<CompanyViewModel>(context);
    return Positioned(
      top: 0,
      height: 272,
      left: 0,
      right: 0,
      // width: ,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: CompanyBackImg(),
            // child: Image.network(
            //   "https://f1.xb969.com/FtUEpE5Ud7KtPHrRG9HX7PvS4byz?imageMogr2/auto-orient/format/jpg",
            //   fit: BoxFit.cover,
            // ),
          ),
          Positioned(
            // color: Colors.green,
            // margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
            left: 20,
            right: 20,
            bottom: 60,
            child: Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  // color: Colors.orange,
                  child:
                      PhotoImg(logo: copanyViewModel.getValue('pmiUserLogo')),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(11, 0, 11, 0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // '欧阳娜娜',
                        '${copanyViewModel.getValue('pmiUserDispname')}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(174, 154, 97, 1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                            child: Row(
                              children: [
                                Container(
                                  // width: 180,
                                  // height: 28,
                                  child: Text(
                                      '机构账户   |  ${copanyViewModel.getValue('balance')}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyBackImg extends StatefulWidget {
  CompanyBackImg({Key key}) : super(key: key);

  @override
  _CompanyBackImgState createState() => _CompanyBackImgState();
}

class _CompanyBackImgState extends State<CompanyBackImg> {
  Widget _itemWid(color, blur) {
    final copanyViewModel = Provider.of<CompanyViewModel>(context);
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.width * 0.5,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            "https://img.wanyx.com/Uploads/ueditor/image/20181204/1543915119913447.jpg",
            // '${copanyViewModel.getValue('pmiUserBackground')}',
            fit: BoxFit.cover,
          ),
          // ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(color: color))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _itemWid(Colors.black.withOpacity(0.3), 4.0);
  }
}

class ProductImg extends StatefulWidget {
  ProductImg({Key key, this.logoUrl}) : super(key: key);
  final String logoUrl;
  @override
  _ProductImgState createState() => _ProductImgState();
}

class _ProductImgState extends State<ProductImg> {
  @override
  Widget build(BuildContext context) {
    print("ProductImg build");

    return Container(
      child: CachedNetworkImage(
        imageUrl: widget.logoUrl,
        fit: BoxFit.cover,
        cacheKey: widget.key.toString(),
        // key: widget.key,
      ),

      // MyImage(
      //   imageProvider: NetworkImage(
      //     widget.logoUrl,
      //   ),
      // ),

      //     Image.network(
      //   widget.logoUrl,
      //   fit: BoxFit.cover,
      //   key: widget.key,
      // ),
    );
  }
}

// 商品管理 列表
class GoodsList extends StatefulWidget {
  GoodsList({Key key}) : super(key: key);

  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  List<Widget> _getItemView(List data) {
    var datas = data;
    // datas.add("1")

    var list = datas.map((value) {
      if (value == "1") {
        return Container(
            margin: EdgeInsets.fromLTRB(0, 12, 10, 15),
            width: 148.0,
            height: 132,
            child: UploadBtnView());
      }
      return Container(
          margin: EdgeInsets.fromLTRB(0, 12, 10, 15),
          width: 148.0,
          height: 132,
          // color: Colors.red,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    color: Color.fromRGBO(228, 227, 227, 1), width: 0.5)),
            child: Column(
              children: [
                Container(
                    height: 80,
                    // color: Colors.blue,
                    width: double.infinity,
                    child: ProductImg(
                      logoUrl: value["productLogo"],
                    )

                    // MyImage(
                    //   imageProvider: NetworkImage(
                    //     value["productLogo"],
                    //   ),
                    // )

                    ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                  width: double.infinity,
                  color: Colors.white,
                  child: Text(
                    value["productTitle"],
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  color: Colors.white,
                  child: Text(
                    '${value['price']}/${value['units']}',
                    style: TextStyle(
                        fontSize: 11, color: Color.fromRGBO(219, 11, 11, 1)),
                  ),
                ),
              ],
            ),
          ));
    });

    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    final copanyViewModel = Provider.of<CompanyViewModel>(context);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: copanyViewModel.productList.length,
        itemBuilder: (BuildContext context, int index) {
          final value = copanyViewModel.productList[index];
          return Container(
              margin: EdgeInsets.fromLTRB(0, 12, 10, 15),
              width: 148.0,
              height: 132,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                        color: Color.fromRGBO(228, 227, 227, 1), width: 0.5)),
                child: Column(
                  children: [
                    Container(
                        height: 80,
                        // color: Colors.blue,
                        width: double.infinity,
                        child: ProductImg(
                          key: Key(index.toString()),
                          logoUrl: value["productLogo"],
                        )

                        // MyImage(
                        //   imageProvider: NetworkImage(
                        //     value["productLogo"],
                        //   ),
                        // )

                        ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                      width: double.infinity,
                      color: Colors.white,
                      child: Text(
                        value["productTitle"],
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: double.infinity,
                      color: Colors.white,
                      child: Text(
                        '${value['price']}/${value['units']}',
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromRGBO(219, 11, 11, 1)),
                      ),
                    ),
                  ],
                ),
              ));
        });

    // ListView(
    //   // This next line does the trick.
    //   scrollDirection: Axis.horizontal,
    //   children: this._getItemView(copanyViewModel.productList),
    // );
  }
}

// 带有阴影的 白色 背景item框
class ItemWhiteShadow extends StatelessWidget {
  const ItemWhiteShadow({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(154, 154, 154, 0.12),
              offset: Offset(0, 0), //阴影x轴偏移量
              blurRadius: 12, //阴影模糊程度
              spreadRadius: 0 //阴影扩散程度
              ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: child,
    );
  }
}

class ImgStyleItem {
  double imgW; //
  double imgH; //
  String imgPath; //
  String title;
  int redNumber = 0;
  ImgStyleItem(double imgW, double imgH, String imgPath, String title,
      {int redNumber = 0}) {
    this.imgW = imgW;
    this.imgH = imgH;
    this.imgPath = imgPath;
    this.title = title;
    this.redNumber = redNumber;
  }
}

class OperationItem extends StatefulWidget {
  OperationItem({Key key, this.type}) : super(key: key);
  final int type;

  @override
  _OperationItemState createState() => _OperationItemState();
}

class _OperationItemState extends State<OperationItem> {
  List<ImgStyleItem> itmes = [];

  Map orderStats = {};

  int getOrderCount(String key) {
    if (this.orderStats.isNotEmpty) {
      return this.orderStats[key] | 0;
    }
    return 0;
  }

  @override
  void initState() {
    super.initState();
  }

  configItems() {
    if (widget.type == 0) {
      ImgStyleItem item1 =
          ImgStyleItem(21, 21, "images/2.0x/icon_fasongdingdan2.png", "生成账单");
      ImgStyleItem item2 =
          ImgStyleItem(21, 21, "images/2.0x/icon_duihuanma2.png", "兑付码");
      ImgStyleItem item3 =
          ImgStyleItem(21, 21, "images/2.0x/icon_jiesuanjigou.png", "结算机构");
      ImgStyleItem item4 =
          ImgStyleItem(21, 21, "images/2.0x/icon_shouqianren.png", "授权人");
      this.itmes = [item1, item2, item3, item4];
    }
    if (widget.type == 1) {
      ImgStyleItem item1 = ImgStyleItem(
        21,
        21,
        "images/2.0x/daizhifu.png",
        "待支付",
        redNumber: this.getOrderCount("noPayCount"),
        // {redNumber = 1},
      );
      ImgStyleItem item2 = ImgStyleItem(
        21,
        21,
        "images/2.0x/daiqueren.png",
        "待确认",
        redNumber: this.getOrderCount("noDeliveryCount"),
      );
      ImgStyleItem item3 = ImgStyleItem(
        21,
        21,
        "images/2.0x/jinxingzhong.png",
        "进行中",
        redNumber: this.getOrderCount("deliveringCount"),
      );
      ImgStyleItem item4 =
          ImgStyleItem(21, 21, "images/2.0x/yiwancheng.png", "已完成");
      this.itmes = [item1, item2, item3, item4];
    }
  }

  List<Widget> _getItemView() {
    this.configItems();
    var datas = this.itmes;
    var list = datas.map((value) {
      return Container(
        child: ItemStyle(
          item: value,
        ),
      );
    });

    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    final companyViewModel = Provider.of<CompanyViewModel>(context);
    this.orderStats = companyViewModel.orderStats;
    return ItemWhite(
      baseChild: Container(
          width: double.infinity,
          height: 104,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                crossAxisSpacing: 10,
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                children: _getItemView()),
          )),
    );
  }
}

class ItemStyle extends StatelessWidget {
  const ItemStyle({Key key, this.item}) : super(key: key);
  final ImgStyleItem item;
  // final String img;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.imgPath,
            width: item.imgW,
            height: item.imgH,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text14(title: item.title),
          )
        ],
      ),
      item.redNumber == 0
          ? Container()
          : Positioned(
              right: 25,
              top: 10,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: new Text(
                  item.redNumber.toString(),
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    ]);
  }
}

class Text14 extends StatelessWidget {
  const Text14({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1)),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
            _words.length - 1,
            //每次生成20个单词
            [
              '2',
              "2",
              "3",
              "2",
              "3",
              "2",
              "3",
              "2",
              "3",
              "2",
              "3",
              "2",
              "3",
              "2",
              "3",
              "2",
              "3",
              "2",
              "3",
              "2",
              "3",
              "2",
              "3"
            ].toList());
      });
    });
  }
}
