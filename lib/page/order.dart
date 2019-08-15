import 'package:flutter/material.dart';
import 'package:flutter_app/page/AddOrder.dart';
import 'package:flutter_app/page/order_list.dart';

class Order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OrderState();
  }
}

class OrderState extends State<Order>
    with  SingleTickerProviderStateMixin {
  TabController _tabController;
  bool show = true;
  final List<Tab> tabs = [
    Tab(text: "等待上门"),
    Tab(text: "已完成"),
    Tab(text: "已取消")
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Offstage(
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddOrder())),
          child: Container(
            child: Text(
              "上门回收",
              style: TextStyle(fontSize: 10),
            ),
            padding: EdgeInsets.all(10),
          ),
        ),
        offstage: !show,
      ),
      appBar: AppBar(
        title: Text(
          "我的订单",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: tabs,
          isScrollable: false,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          OrderList(),
          Text("2"),
          Text("3")
        ],
        controller: _tabController,
      ),
    );
  }

//  @override
//  // TODO: implement wantKeepAlive
//  bool get wantKeepAlive => true;
}

class Choice {
  Choice({this.title});

  String title;
}
