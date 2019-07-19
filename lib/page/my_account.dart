import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new My();
  }
}

class My extends State<MyAccount> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    Overlay.of(context).insert(show());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "我的",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.green,
                height: height / 3,
                width: width,
              ),
              Card(
                elevation: 0.8,
                margin: EdgeInsets.only(left: 10,right: 10,top: 80),
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: new Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("兑换区："),
                          InkWell(
                            child: Text(
                              "兑换规则",
                              style: TextStyle(),
                            ),
                            onTap: null,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text("月卡："),
                            margin: EdgeInsets.only(top: 10),
                          ),
                          Container(
                            child: Text("消耗30环保星"),
                            margin: EdgeInsets.only(top: 10),
                          ),
                          new Expanded(
                              child: Container(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              child: Text(
                                "兑换",
                              ),
                              onTap: null,
                            ),
                            margin: EdgeInsets.only(top: 10),
                          )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text("季卡："),
                            margin: EdgeInsets.only(top: 10),
                          ),
                          Container(
                            child: Text("消耗120环保星"),
                            margin: EdgeInsets.only(top: 10),
                          ),
                          new Expanded(
                              child: Container(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              child: Text(
                                "兑换",
                              ),
                              onTap: null,
                            ),
                            margin: EdgeInsets.only(top: 10),
                          )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text("年卡："),
                            margin: EdgeInsets.only(top: 10),
                          ),
                          Container(
                            child: Text("消耗360环保星"),
                            margin: EdgeInsets.only(top: 10),
                          ),
                          new Expanded(
                              child: Container(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              child: Text(
                                "兑换",
                              ),
                              onTap: null,
                            ),
                            margin: EdgeInsets.only(top: 10),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 30,
            right: 30,
            top: (height / 12) * 3,
            child: Container(
              child: Card(
                elevation: 0.8,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Container(
                  margin:EdgeInsets.all(16) ,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[Text("环保星"), Text("-颗")],
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[Text("环保金"), Text("-元")],
                        ),
                        margin: EdgeInsets.only(top: 10),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text("本月已签到"),
                            Text("-天"),
                            Expanded(
                              child: InkWell(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text("签到")),
                                onTap: null,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  OverlayEntry show() {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return new Positioned(
          top: (MediaQuery.of(context).size.height / 9) * 2,
          child: new Material(
            child: new Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: new Card(
                child: new Padding(
                  padding: EdgeInsets.all(8),
                  child: new Text("test"),
                ),
                color: Colors.grey,
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry

    //两秒后，移除Toast
//    new Future.delayed(Duration(seconds: 2)).then((value) {
//      overlayEntry.remove();
//    });
  }
}
