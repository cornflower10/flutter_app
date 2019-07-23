import 'package:flutter/material.dart';
import 'package:flutter_app/widget/TextEllipsis.dart';

class AddOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddOrderState();
  }
}

class AddOrderState extends State<AddOrder> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("填写预约"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[address()],
      ),
    );
  }

  Widget address() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 12,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "放",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                           Container(
                            child: Text("18550073882"),
                            alignment: Alignment.centerLeft,
                          ),


                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.black38,
                            ),
                          ),
                          Expanded(
                              flex: 8,
                              child: Text(
                                "dfhs回复空间錒十分看好卡接电话客户反馈收到就发贺卡好风景啊翻",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black38,
                ))
          ],
        ),
      ),
    );
  }

  Widget tags() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "--",
                  style: TextStyle(fontSize: 10),
                ),
                Text("---")
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.black38,
                ),
                Text("--")
              ],
            )
          ],
        ),
      ),
    );
  }
}
