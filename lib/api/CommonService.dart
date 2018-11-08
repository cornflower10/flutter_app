import 'package:dio/dio.dart';
import 'package:flutter_app/api/Api.dart';

class CommonService{

  Options _getOptions(){
    return Options(
      headers:{
        'X-App-Type':'android',
      'X-App-Key': 'android',
      'X-App-Version':'2.0.8',
      'X-App-Env':'dev'}
    );
  }
  void getBanner(Function callBack) async{
    Dio().get(Api.HOME_BANNER,options: _getOptions())
        .then((response){callBack(response.data);},)
        .catchError((error){
          print('error:'+error.toString());
    });
  }
}