import 'dart:convert';


import 'package:flutter_app/entity/OrderItem.dart';
class OrderRepository{

  Future<List<OrderItem>> orderList() async{
    String jsonData = "[\n" +
        "    {\n" +
        "        \"orderTime\":\"466564545\",\n" +
        "        \"type\":\"1\",\n" +
        "        \"amount\":\"2.0\",\n" +
        "        \"okTime\":\"6545646464\",\n" +
        "        \"orderNO\":\"465454646\"\n" +
        "    },\n" +
        "    {\n" +
        "        \"orderTime\":\"46652645452\",\n" +
        "        \"type\":\"2\",\n" +
        "        \"amount\":\"2.0\",\n" +
        "        \"okTime\":\"65452646464\",\n" +
        "        \"orderNO\":\"2465454646\"\n" +
        "    }\n" +
        "]";
    List data = json.decode(jsonData);
    List<OrderItem> list = new List();
    if(data!=null){
      list = data?.map((value){
        OrderItem orderItem = OrderItem.fromJson(value);
        return orderItem;
      })?.toList();
    }
    return list;
  }
}