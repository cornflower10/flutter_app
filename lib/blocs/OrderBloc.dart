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

  StreamController<int> statusStreamController =
      new StreamController<int>.broadcast();

  StreamSink<int> get statusSink => statusStreamController.sink;

  Stream<int> get statusStrem => statusStreamController.stream;

  int page = 0;

  OrderRepository _orderRepository = OrderRepository();

  @override
  void dispose() {
    _streamController.close();
    statusStreamController.close();
    LogUtils.d("_streamController.close()");
  }

  getOrders(status, bool isReload) {
    page = 0;
    if (isReload == true) {
      status = CusLoadStatus.loading;
      _sink.add(null);
    }
    _orderRepository.orderList().then((list) {
      status = CusLoadStatus.status(hasError: false, data: list, refresh: true);
      LogUtils.d("status:$status");
      statusSink.add(status);
      _sink.add(list);
    }).catchError((error) {
      status = CusLoadStatus.status(hasError: true, refresh: true);
      statusSink.add(status);
      _sink.addError(error);
    });
  }

  getOrdersLoadMore(int status) {
    page++;
    _orderRepository.orderList().then((list) {
      status =
          CusLoadStatus.status(hasError: false, data: list, loadMore: true);
      statusSink.add(status);
      _sink.add(list);
    }).catchError((error) {
      page--;
      status = CusLoadStatus.status(hasError: true, loadMore: true);
      statusSink.add(status);
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
