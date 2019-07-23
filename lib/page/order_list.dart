import 'package:flutter/material.dart';

class OrderList extends StatefulWidget{
  bool show = true;
  final callback;
  OrderList({Key key,this.show,this.callback}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderListState();
  }


}

class OrderListState extends State<OrderList> with AutomaticKeepAliveClientMixin{
  bool show;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("OrderListState");
    show = widget.show;
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NotificationListener(child: ListView.builder(
      itemBuilder: _buildItem,
      itemCount: 20,
    ) ,onNotification: _onNotification,);

  }

  Widget _buildItem(BuildContext c, int index) {
    if (index.isOdd) {
      return new Divider();
    }
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(child:  Image(
            image: new AssetImage("images/fund_bac.png"),
            height: 100,
            fit: BoxFit.cover,
          ),flex: 2,)
          , Expanded(
              flex: 5,
              child:  Container(
                height: 100,
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("预约时间：--"),
                    Container(
                      padding:
                      EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Text(
                        "废金属",
                        style: TextStyle(color: Colors.grey,fontSize: 10),
                      ),
                    ),
                    Text(
                      "￥1.02元",
                      style: TextStyle(color: Colors.red),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "--",
                          style: TextStyle(color: Colors.green),
                        ),
                        Expanded(child:  Align(child:Text("下单时间--") ,alignment: Alignment.centerRight,))

                        ,

                      ],
                    )
                  ],
                ),
              ))

        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  bool _onNotification(Notification notification) {

    switch (notification.runtimeType){
      case ScrollStartNotification: update(false); break;
      case ScrollUpdateNotification: update(false); break;
      case ScrollEndNotification: update(true); break;
      case OverscrollNotification: update(true); break;
    }
    if(notification is ScrollEndNotification){

    }else if(notification is ScrollUpdateNotification){
      show = false;
      widget.callback(show);
    }
  }

  update(value){
    setState(() {
      show = value;
      widget.callback(show);
    });
  }
}