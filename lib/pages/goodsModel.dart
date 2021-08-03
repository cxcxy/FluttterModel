// @dart=2.9
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
Welcome welcomeFromMapJson(Map<String, dynamic> map) => Welcome.fromJson(map);
String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.recommendId,
    this.productTitle,
    this.productDetails,
    this.htmlProductDetails,
    this.productLogo,
    this.companyName,
    this.companyArea,
    this.companyAddress,
    this.createUserId,
    this.createUserDispname,
    this.createUserLogo,
    this.createUserProfile,
    this.fmtCreateDate,
    this.visibleType,
    this.likeStatus,
    this.state,
    this.commentCount,
    this.likeCount,
    this.likeList,
    this.commentList,
  });

  int recommendId;
  String productTitle;
  String productDetails;
  String htmlProductDetails;
  String productLogo;
  String companyName;
  String companyArea;
  String companyAddress;
  int createUserId;
  String createUserDispname;
  String createUserLogo;
  String createUserProfile;
  String fmtCreateDate;
  bool visibleType;
  bool likeStatus;
  bool state;
  int commentCount;
  int likeCount;
  List<LikeList> likeList;
  List<CommentList> commentList;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        recommendId: json["recommendId"],
        productTitle: json["productTitle"],
        productDetails: json["productDetails"],
        htmlProductDetails: json["htmlProductDetails"],
        productLogo: json["productLogo"],
        companyName: json["companyName"],
        companyArea: json["companyArea"],
        companyAddress: json["companyAddress"],
        createUserId: json["createUserId"],
        createUserDispname: json["createUserDispname"],
        createUserLogo: json["createUserLogo"],
        createUserProfile: json["createUserProfile"],
        fmtCreateDate: json["fmtCreateDate"],
        visibleType: json["visibleType"],
        likeStatus: json["likeStatus"],
        state: json["state"],
        commentCount: json["commentCount"],
        likeCount: json["likeCount"],
        likeList: List<LikeList>.from(
            json["likeList"].map((x) => LikeList.fromJson(x))),
        commentList: List<CommentList>.from(
            json["commentList"].map((x) => CommentList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recommendId": recommendId,
        "productTitle": productTitle,
        "productDetails": productDetails,
        "htmlProductDetails": htmlProductDetails,
        "productLogo": productLogo,
        "companyName": companyName,
        "companyArea": companyArea,
        "companyAddress": companyAddress,
        "createUserId": createUserId,
        "createUserDispname": createUserDispname,
        "createUserLogo": createUserLogo,
        "createUserProfile": createUserProfile,
        "fmtCreateDate": fmtCreateDate,
        "visibleType": visibleType,
        "likeStatus": likeStatus,
        "state": state,
        "commentCount": commentCount,
        "likeCount": likeCount,
        "likeList": List<dynamic>.from(likeList.map((x) => x.toJson())),
        "commentList": List<dynamic>.from(commentList.map((x) => x.toJson())),
      };
}

class CommentList {
  CommentList({
    this.commentId,
    this.content,
    this.fmtContentDate,
    this.contentDate,
    this.userId,
    this.displayName,
    this.userLogo,
    this.commentLikeCount,
    this.likeStatus,
  });

  int commentId;
  String content;
  String fmtContentDate;
  String contentDate;
  int userId;
  String displayName;
  String userLogo;
  int commentLikeCount;
  bool likeStatus;

  factory CommentList.fromJson(Map<String, dynamic> json) => CommentList(
        commentId: json["commentId"],
        content: json["content"],
        fmtContentDate: json["fmtContentDate"],
        contentDate: json["contentDate"],
        userId: json["userId"],
        displayName: json["displayName"],
        userLogo: json["userLogo"],
        commentLikeCount: json["commentLikeCount"],
        likeStatus: json["likeStatus"],
      );

  Map<String, dynamic> toJson() => {
        "commentId": commentId,
        "content": content,
        "fmtContentDate": fmtContentDate,
        "contentDate": contentDate,
        "userId": userId,
        "displayName": displayName,
        "userLogo": userLogo,
        "commentLikeCount": commentLikeCount,
        "likeStatus": likeStatus,
      };
}

class LikeList {
  LikeList({
    this.userId,
    this.displayName,
    this.userLogo,
  });

  int userId;
  String displayName;
  String userLogo;

  factory LikeList.fromJson(Map<String, dynamic> json) => LikeList(
        userId: json["userId"],
        displayName: json["displayName"],
        userLogo: json["userLogo"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "displayName": displayName,
        "userLogo": userLogo,
      };
}
