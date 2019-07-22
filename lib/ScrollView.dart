import 'package:flutter/material.dart';

class ScrollViewTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScrollViewState();
  }
}

class ScrollViewState extends State<ScrollViewTest> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
              sliver: SliverPadding(
            padding: EdgeInsets.all(
              10,
            ),
            sliver:
                SliverList(delegate: new SliverChildListDelegate(<Widget>[
                  Text("test"),       Text("test"),       Text("test"),
                ])),
          ))
        ],
      ),
    );
  }
}
