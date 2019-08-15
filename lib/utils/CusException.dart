import 'package:flutter/material.dart';

class CusException implements Exception{
  String code;
  String msg;
  CusException(this.code,this.msg);

  toString() {
    if (msg == null) return "CusExption";
    return "CusExption: $code:$msg";
  }

  static forAction(CusException e,BuildContext context){
    if(e.code=="NT-0001"){
      //
    }
  }
}