import 'dart:async';

import 'package:flutter_app/blocs/BaseBloc.dart';
import 'package:flutter_app/data/IndexRepository.dart';
import 'package:flutter_app/entity/Banners.dart';

class IndexBloc implements BaseBloc {
  StreamController<List<Banners>> _streamController =
      StreamController<List<Banners>>();

  StreamSink<List<Banners>> get _sink =>
      _streamController.sink; // 这个 sink 用与给 outCounter 添加数据
  Stream<List<Banners>> get out =>
      _streamController.stream; // 这个就是 ui 需要使用的 stream

  // 处理业务逻辑的stream
//  StreamController _actionController = StreamController();
//  StreamSink get errorCounter => _actionController.sink;

  IndexRepository _indexRepository = IndexRepository();

  @override
  void dispose() {
    _streamController.close();
//    incrementCounter.close();
  }

  listener() {
//    _actionController.stream.listen(getBanners());
  }

    getBanners() {
    _indexRepository.bannerList().then((list) {
      _sink.add(list);
    }).catchError((error){
      print("error$error");
      print("getBanners$error");
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
