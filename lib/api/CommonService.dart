import 'package:dio/dio.dart';
import 'package:flutter_app/api/Api.dart';

class CommonService{
  void getBanner(Function callBack) async{
    Dio().get(Api.HOME_BANNER).then((response){callBack(response.data);},);
  }
}