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
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.green,
                  height: height / 3,
                  width: width,
                ),
                Card(
                  elevation: 0.8,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 80),
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
                                child: exchange(context),
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

                                child: exchange(context),

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

                                child: exchange(context),

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
                  margin: EdgeInsets.all(16),
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
                                    child: sign()),
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

  Widget sign() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          child: Text("签到"),
          padding: EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 5),
          color: Colors.green,
        ));
  }
  Widget exchange(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 65,
          height: 26,
          child: FlatButton(child: Text("兑换"),onPressed: _neverSatisfied,),
          color: Colors.green,
        ));
  }

  Future<void> _neverSatisfied() async { {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('兑换'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('确定要兑换？'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}}
