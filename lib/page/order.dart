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
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
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
    // TODO: implement build
    super.build(context);
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
          OrderList(
            callback: (value) {
              setState(() {
                print(value);
                show = value;
              });
            },
          ),
          OrderList(),
          Text("3")
        ],
        controller: _tabController,
      ),
    );
  }

//  listOrder() {
//    return ListView.builder(
//      itemBuilder: _buildItem,
//      itemCount: 20,
//    );
//  }

//  Widget _buildItem(BuildContext c, int index) {
//    if (index.isOdd) {
//      return new Divider();
//    }
//    return Container(
//      padding: EdgeInsets.all(16),
//      child: Row(
//        children: <Widget>[
//          Expanded(child:  Image(
//            image: new AssetImage("images/fund_bac.png"),
//            height: 100,
//            fit: BoxFit.cover,
//          ),flex: 2,)
//         , Expanded(
//            flex: 5,
//              child:  Container(
//            height: 100,
//            padding: EdgeInsets.only(left: 16),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text("预约时间：--"),
//                Container(
//                  padding:
//                  EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
//                  decoration:
//                  BoxDecoration(border: Border.all(color: Colors.grey)),
//                  child: Text(
//                    "废金属",
//                    style: TextStyle(color: Colors.grey,fontSize: 10),
//                  ),
//                ),
//                Text(
//                  "￥1.02元",
//                  style: TextStyle(color: Colors.red),
//                ),
//                Row(
//                  children: <Widget>[
//                    Text(
//                      "--",
//                      style: TextStyle(color: Colors.green),
//                    ),
//                    Expanded(child:  Align(child:Text("下单时间--") ,alignment: Alignment.centerRight,))
//
//                    ,
//
//                  ],
//                )
//              ],
//            ),
//          ))
//
//        ],
//      ),
//    );
//  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Choice {
  Choice({this.title});

  String title;
}
