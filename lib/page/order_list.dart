import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/BaseBloc.dart';
import 'package:flutter_app/blocs/IndexBloc.dart';
import 'package:flutter_app/blocs/OrderBloc.dart';
import 'package:flutter_app/entity/OrderItem.dart';
import 'package:flutter_app/utils/CusException.dart';
import 'package:flutter_app/utils/CusLoadStatus.dart';
import 'package:flutter_app/utils/LogUtils.dart';
import 'package:flutter_app/widget/RefreshView.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'order.dart';

class OrderList extends StatefulWidget {
  bool show = true;
  final callback;

  OrderList({Key key, this.show, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderListState();
  }
}

class OrderListState extends State<OrderList>
    with AutomaticKeepAliveClientMixin {
  bool show;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<OrderItem> _list = [];
  OrderBloc orderBloc;
  ScrollController scrollController = ScrollController();
  int status = CusLoadStatus.loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("OrderListState");
    show = widget.show;
    scrollController.addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    orderBloc = BlocProvider.of<OrderBloc>(context);
    orderBloc.statusStrem.listen((cStatus){
      LogUtils.d("-----------listen---------$cStatus");
      status = cStatus;
    });
    LogUtils.d("-----------build---------");
    return StreamBuilder(
        stream: orderBloc.out,
        builder: (BuildContext context, AsyncSnapshot<List<OrderItem>> list) {

          if (status ==CusLoadStatus.loading) {
            _onRefresh();
          }
          if (list.hasData) {
            _list.addAll(list.data);
          }
          if(list.hasError){
            CusException.forAction(list.error,context);
          }

             return RefreshView(
                  refreshController: _refreshController,
                  enablePullUp: true,
                  child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: _buildItem,
                    itemCount: _list == null ? 0 : _list.length,
                  ),
                  onRefresh: _onRefresh,
                  loadMore: _loadMore,
                   status: status,

                );

        });
  }

  Widget _buildItem(BuildContext c, int index) {
    OrderItem order = _list[index];

    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Image(
              image: new AssetImage("images/fund_bac.png"),
              height: 100,
              fit: BoxFit.cover,
            ),
            flex: 2,
          ),
          Expanded(
              flex: 5,
              child: Container(
                height: 100,
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("预约时间：" + order.orderTime),
                    Container(
                      padding:
                          EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Text(
                        "废金属",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                    Text(
                      order.amount,
                      style: TextStyle(color: Colors.red),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "--",
                          style: TextStyle(color: Colors.green),
                        ),
                        Expanded(
                            child: Align(
                          child: Text("下单时间" + order.okTime),
                          alignment: Alignment.centerRight,
                        )),
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
    switch (notification.runtimeType) {
      case ScrollStartNotification:
        update(false);
        break;
      case ScrollUpdateNotification:
        update(false);
        break;
      case ScrollEndNotification:
        update(true);
        break;
      case OverscrollNotification:
        update(true);
        break;
    }
    if (notification is ScrollEndNotification) {
    } else if (notification is ScrollUpdateNotification) {
      show = false;
      widget.callback(show);
    }
  }

  update(value) {
//    setState(() {
//      show = value;
//      widget.callback(show);
//    });
  }

  Future<void> _onRefresh({bool isReload}) async {
    await Future.delayed(Duration(milliseconds: 5000));
    LogUtils.d("-----------_onRefresh---------");
    _list.clear();
    orderBloc.getOrders(status,isReload);
  }

  void _listener() {
    LogUtils.d("off" + scrollController.offset.toString());
  }

  void _loadMore({bool up}) async {
    
    await Future.delayed(Duration(milliseconds: 5000));
    LogUtils.d("-----------_loadMore---------");
    orderBloc.getOrdersLoadMore(status);
  }
}
