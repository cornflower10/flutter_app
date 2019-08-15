import 'package:dio/dio.dart';
import 'package:flutter_app/api/BaseData.dart';
import 'package:flutter_app/api/BaseNet.dart';
import 'package:flutter_app/utils/CusException.dart';

 class NetUtils{
  static NetUtils _instance;
 static Options _getOptions(){
    return Options(
        headers:{
          'X-App-Type':'android',
          'X-App-Key': 'android',
          'X-App-Version':'2.4.4',
          'X-App-Env':'dev'}
    );
  }
  NetUtils(){
    BaseNet.getInstance().setConfig(httpConfig);
  }
  HttpConfig httpConfig = new HttpConfig(options:_getOptions());

  static NetUtils getInstance(){
    if(_instance==null)
      _instance = NetUtils();
    return _instance;
  }

  Future<BaseData<T>> get<T>(String path) async{
     BaseData<T> ba = await BaseNet.getInstance().request(Method.get, path);
//     if(ba.code!="NT-0000"){
//       throw CusException(ba.code,ba.messge);
//     }
     return ba;
  }
  Future<BaseData<T>> post<T>(String path,{data}) async{
    BaseData<T> ba  =  await BaseNet.getInstance().request(Method.post, path,data: data);
    if(ba.code!="NT-0000"){
      throw CusException(ba.code,ba.messge);
    }
    return ba;
  }
}