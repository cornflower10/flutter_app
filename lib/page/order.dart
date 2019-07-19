import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OrderState();
  }
}

class OrderState extends State<Order> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin{

  TabController _tabController;
  final List<Tab> tabs = [Tab(text:"等待上门"),Tab(text:"已完成"),Tab(text:"已取消")];
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
      appBar: AppBar(
        title: Text(
          "我的订单",
          style: TextStyle(color: Colors.white),
                   ),
          centerTitle: true,
        bottom: TabBar(tabs: tabs,isScrollable: false,controller: _tabController,),
                    ),
      body: TabBarView(children: <Widget>[
        Text("1"),    Text("2"),    Text("3")
      ],controller:_tabController ,),
    );
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}



class Choice{
  Choice({this.title});
   String title;
}


