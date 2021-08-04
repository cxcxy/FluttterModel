// @dart=2.9
import 'package:flutter/material.dart';
// import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_boost/flutter_boost.dart';
// import 'pages/lifecycle_test_page.dart';
// import 'package:flutter_boost/page_visibility.dart';
import 'package:flutter_boost/flutter_boost_app.dart';
import 'package:flutter_module/pages/recommentGoodsDetail.dart';
// import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/vc/flutterPage.dart';
import 'package:flutter_module/vc/myDefalutApp.dart';
import 'package:flutter_module/vc/MyDefalutApp2.dart';
import 'package:flutter_module/vc/page_bill.dart';
import 'package:flutter_module/vc/page_bill_provider.dart';
import 'package:flutter_module/vc/complaints.dart';
import 'package:flutter_module/pages/company.dart';

//BoostFlutterBinding用于接管Flutter App的生命周期，必须得接入的
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

void main() {
  ///添加全局生命周期监听类
  // PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());

  ///这里的CustomFlutterBinding调用务必不可缺少，用于控制Boost状态的resume和pause
  CustomFlutterBinding();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    '/': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => MyDefalutApp());
    },
    'tab_friend': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => MyDefalutApp());
    },
    'to_goods_main': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) {
            Map<String, Object> mapobj = settings.arguments;
            String data = mapobj['data'];
            return GoodsMain(
              // data: mapobj,
              data: data,
            );
          });
    },
    'embedded': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => MyDefalutApp());
    },
    'firstFirst': (settings, uniqueId) {
      print('flutterPage settings:$settings, uniqueId:$uniqueId');
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) =>
              ComplaintsMain(params: settings.arguments));
    },
    'page_bill': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => BillInfo());
    },
    'create_bill': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => BillInfo());
    },
    'company_page': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => CompanyPage());
    },
    'page_bill_provider': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => BillProviderDemo());
    }
  };
  Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {
    FlutterBoostRouteFactory func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory);
  }

  static Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
    );
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}
}

class BoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didPush' + route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didPop' + route.settings.name);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didRemove' + route.settings.name);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didStartUserGesture' + route.settings.name);
  }
}
