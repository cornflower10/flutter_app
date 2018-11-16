import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/api/CommonService.dart';
import 'package:flutter_app/entity/homebanner.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePageFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePageFul> {
  homebanner homeBanner;

  var result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBanner();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
              //监听返回按钮
    return new WillPopScope(
        child: Scaffold(
          body: new Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/fund_bac.png',
                  fit: BoxFit.cover,
                ),
                Container(
                    margin: EdgeInsets.only(top: 16),
                    height: 30,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                              child: Text("集合计划"),
                            ),
                            flex: 1),
                        Expanded(
                            child: Center(
                              child: Text("公募产品"),
                            ),
                            flex: 1),
                        Expanded(
                            child: Center(
                              child: RaisedButton(
                                onPressed: () {
                                  getReact();
                                },
                                child: Text("调用原生${result}"),
                              ),
                            ),
                            flex: 1)
                      ],
                    )),
                _banner()
              ],
            ),
          ),
        ),
        onWillPop: () {
          Navigator.pop(context);//返回按钮监听移除此页面
        });
  }

  void getReact() async {
    final channel = const MethodChannel('samples.flutter.io/battery');
    var success = await channel.invokeMethod('battery');
    setState(() {
      result = success;
    });
    print(success);
  }

  Widget _banner() {
    if (homeBanner != null) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        height: 100,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: homeBanner.data.length,
          scrollDirection: Axis.horizontal,
          autoplay: true,
        ),
      );
    } else {
      return Center(
        child: Text('loading'),
      );
    }
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      homeBanner.data[index].url,
      fit: BoxFit.fill,
    ));
  }

  void loadBanner() {
    CommonService().getBanner((data) {
//      var map =  json.decode(data.toString());
      setState(() {
        homeBanner = homebanner.fromJson(data);
      });
      print("respose:" + homeBanner.toString());
    });
  }
}
