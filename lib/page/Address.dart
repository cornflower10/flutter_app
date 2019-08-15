import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/ScreenUtil.dart';
import 'package:flutter_baidu_map_sdk/flutter_baidu_map.dart';

class Address extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AddressState();
  }
}

class AddressState extends State<Address> implements ReceiveCallBack{
  GlobalKey<FormState> _formKey = new GlobalKey();
  String _name;
  String _phone;
  String _address = "请选择地址";
  String _addressDetail;

  TextEditingController _addTextEdit = TextEditingController();

  FocusNode _mFocusNode = FocusNode();

  FlutterBaiduMap _flutterPlugin = null;

  @override
  Widget build(BuildContext context) {
    _mFocusNode.unfocus();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("地址"),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildListDelegate([
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              onSaved: (val) => _name = val,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                ),
                                contentPadding: EdgeInsets.only(
                                    right: 10, top: 10, bottom: 10),
                                border: InputBorder.none,
                                hintText: "请输入姓名",
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          Divider(
                            height: 1,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.phone,
                              onSaved: (val) => _phone = val,
                              validator: (val) {
                                if (val.length != 11) {
                                  return "手机号码格式有误";
                                }
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.phone,
                                ),
                                contentPadding: EdgeInsets.only(
                                    right: 10, top: 10, bottom: 10),
                                border: InputBorder.none,
                                hintText: "请输入手机号",
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          Divider(
                            height: 1,
                          ),
                          InkWell(
                            onTap:()=> _initPlatformState(),
                            child: TextFormField(
                                enabled: false,
                                focusNode: _mFocusNode,
                                onSaved: (val) => _address = val,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.location_on,
                                    ),
                                    contentPadding: EdgeInsets.only(
                                        right: 10, top: 10, bottom: 10),
                                    border: InputBorder.none,
                                    hintText: _address,
                                    hintStyle: TextStyle(color: Colors.grey))),
                          ),
                          Divider(
                            height: 1,
                          ),
                          TextFormField(
                            controller: _addTextEdit,
                              onSaved: (val) => _addressDetail = val,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.location_on,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      right: 10, top: 10, bottom: 10),
                                  border: InputBorder.none,
                                  hintText: "请输入详细地址",
                                  hintStyle: TextStyle(color: Colors.grey))),
                          Divider(
                            height: 1,
                          ),
                          _commit()
                        ],
                      ))
                ]))
              ],
            )));
  }

  _commit() {
    return Container(
        margin: EdgeInsets.all(16),
        child: InkWell(
          child: MaterialButton(
            shape: StadiumBorder(),
            height: 40,
            minWidth: ScreenUtil.getInstance().screenWidth,
            color: Colors.green,
            child: Text(
              "确定",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }


    void _initPlatformState() {
      _flutterPlugin = new FlutterBaiduMap(this);
      FlutterBaiduMap.startLocation();
      _flutterPlugin.initReceiveLocation();
    }


  @override
  void onEnvent(Object o) {
    setState(() {
      _address = o.toString();
    });

  }

  @override
  void onError(Object o) {

  }

}
