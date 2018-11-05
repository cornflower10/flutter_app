import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
       decoration: new BoxDecoration(color: Colors.white),
       child: new Text('dart',style: new TextStyle(fontSize: 20.0,color:Colors.amberAccent),textDirection: TextDirection.ltr,),
    );
  }

}