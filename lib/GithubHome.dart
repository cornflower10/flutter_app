import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/api/CommonService.dart';
import 'package:flutter_app/entity/homebanner.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GithubHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<GithubHome> {
  homebanner homeBanner;
  PageController pageController;
  int _currentIndex = 0;

  var result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //监听返回按钮
    return new Scaffold(
      body: new Container(
        color: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text('trending'),
                icon: Icon(Icons.account_balance),
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                title: Text('stars'),
                icon: Icon(Icons.star),
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                title: Text('respos'),
                icon: Icon(Icons.account_balance),
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                title: Text('my'),
                icon: Icon(Icons.account_box),
                backgroundColor: Colors.grey)
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }

//  void getReact() async {
//    final channel = const MethodChannel('samples.flutter.io/battery');
//    var success = await channel.invokeMethod('battery');
//    setState(() {
//      result = success;
//    });
//    print(success);
//  }

//  Widget _banner() {
//    if (homeBanner != null) {
//      return Container(
//        margin: EdgeInsets.only(top: 16),
//        height: 100,
//        child: Swiper(
//          itemBuilder: _swiperBuilder,
//          itemCount: homeBanner.data.length,
//          scrollDirection: Axis.horizontal,
//          autoplay: true,
//        ),
//      );
//    } else {
//      return Center(
//        child: Text('loading'),
//      );
//    }
//  }

//  Widget _swiperBuilder(BuildContext context, int index) {
//    return (Image.network(
//      homeBanner.data[index].url,
//      fit: BoxFit.fill,
//    ));
//  }

}
