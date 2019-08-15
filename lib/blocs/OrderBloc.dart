import 'dart:async';

import 'package:flutter_app/blocs/BaseBloc.dart';
import 'package:flutter_app/data/IndexRepository.dart';
import 'package:flutter_app/data/OrderRepository.dart';
import 'package:flutter_app/entity/Banners.dart';
import 'package:flutter_app/entity/OrderItem.dart';
import 'package:flutter_app/utils/CusLoadStatus.dart';
import 'package:flutter_app/utils/LogUtils.dart';

class OrderBloc implements BaseBloc {
  StreamController<List<OrderItem>> _streamController =
      StreamController<List<OrderItem>>.broadcast();

  StreamSink<List<OrderItem>> get _sink =>
      _streamController.sink; // 这个 sink 用与给 outCounter 添加数据
  Stream<List<OrderItem>> get out =>
      _streamController.stream; // 这个就是 ui 需要使用的 stream

  int page = 0;

  OrderRepository _orderRepository = OrderRepository();

  @override
  void dispose() {
    _streamController.close();
    LogUtils.d("_streamController.close()");
  }

    getOrders(status) {
      page = 0;
      _orderRepository.orderList().then((list) {
      status = CusLoadStatus.status(hasError: false,data: list,refresh: true);
      _sink.add(list);
    }).catchError((error){
        status = CusLoadStatus.status(hasError: true,refresh: true);
      _sink.addError(error);

    });
  }

  getOrdersLoadMore(int status) {
    page++;
    _orderRepository.orderList().then((list) {
      status = CusLoadStatus.status(hasError: false,data: list,loadMore: true);
      _sink.add(list);
    }).catchError((error){
      page--;
      status = CusLoadStatus.status(hasError: true,loadMore: true);
      _sink.addError(error);
    });
  }

  @override
  Future getData({String labelId, int page}) {
    // TODO: implement getData
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    // TODO: implement onLoadMore
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    // TODO: implement onRefresh
    return null;
  }
}
