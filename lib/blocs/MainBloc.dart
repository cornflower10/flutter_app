import 'dart:async';

import 'BaseBloc.dart';

class MainBloc implements BaseBloc {
  StreamController<int> _streamController =
  StreamController<int>.broadcast();

  StreamSink<int> get _sink =>
      _streamController.sink; // 这个 sink 用与给 outCounter 添加数据
  Stream<int> get out =>
      _streamController.stream; // 这个就是 ui 需要使用的 stream


  changeChoose(int value){
    _sink.add(value);
  }
  @override
  void dispose() {
    _streamController.close();
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