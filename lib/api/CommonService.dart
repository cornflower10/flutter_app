import 'package:dio/dio.dart';
import 'package:flutter_app/api/Api.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_app/api/BaseData.dart';

class CommonService{

  Options _getOptions(){
    return Options(
      headers:{
        'X-App-Type':'android',
      'X-App-Key': 'android',
      'X-App-Version':'2.3.8',
      'X-App-Env':'dev'}
    );
  }
  void getBanner(Function callBack,Function errorCallBack) async{
    Dio().get(Api.HOME_BANNER,options: _getOptions())
        .then((response){callBack(response.data);},)
        .catchError((error){
           errorCallBack(error);
          print('error:'+error.toString());
    });
  }
  Future<BaseData<T>> get<T>(String url,Function callBack,Function errorCallBack) async{
    Dio().get(url,options: _getOptions())
        .then((response){callBack(response.data);},)
        .catchError((error){
      errorCallBack(error);
      print('error:'+error.toString());
    });
  }
  void post(String url,String data,Function callBack,Function errorCallBack) async{
    Dio().post(url,data:data,options: _getOptions())
        .then((response){callBack(response.data);},)
        .catchError((error){
      errorCallBack(error);
      print('error:'+error.toString());
    });
  }

  void getlogin(Function callBack)async{
    Dio().get(Api.LOGIN)
        .then((res){
          callBack(res.data);
//          print(res.data);
    })
        .catchError(
            (error){print(error.toString());});
  }

  void loginPost(login,password,Function callBack)async{
    String auth = login+':'+password;

    Dio().get(Api.USER,options: Options(headers: {
      'Authorization':'Basic '+Base64Codec().encode(Utf8Codec().encode(auth))

    })).then((res){
      callBack(res.data);
//          print(res.data);
    })
        .catchError(
            (error){
              print('error:'+error.toString());
            });
  }


  void trending(Function callBack)async{

    Dio().get(Api.TRENDING
    ).then((res){
      callBack(res.data);
//          print(res.data);
    })
        .catchError(
            (error){
          print('error:'+error.toString());
        });
  }
}