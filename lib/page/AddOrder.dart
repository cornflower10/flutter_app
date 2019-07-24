import 'package:flutter/material.dart';
import 'package:flutter_app/widget/TextEllipsis.dart';

class AddOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddOrderState();
  }
}

class AddOrderState extends State<AddOrder> {
  List<TagItem> _list = [];
  bool show = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("填写预约"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          address(),
          Offstage(
            child: _chooseType(),
            offstage: !show,
          ),
          Offstage(
            child: tags(),
            offstage: show,
          )
        ],
      ),
    );
  }

  Widget address() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: 12,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "放",
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Text("18550073882"),
                              alignment: Alignment.centerRight,
                            ),
                            flex: 5,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.black38,
                                size: 18,
                              ),
                            ),
                            Expanded(
                                flex: 10,
                                child: Text(
                                  "dfhs回复空间錒十分看好卡接电话客户反馈收到就发贺卡好风景啊翻",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )),
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black38,
                    size: 14.0,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget tags() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(
            16,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "请添加您需要上门回收的物品吧",
              ),
              Text(
                "(5kg以上才提供上门回收服务)",
                style: TextStyle(fontSize: 14),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                      size: 16,
                    ),
                    InkWell(
                      child: Container(
                        child: Text(
                          "立即添加",
                          style: TextStyle(fontSize: 12),
                        ),
                        margin: EdgeInsets.only(left: 10),
                      ),
                      onTap: _showBottomSheet,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showBottomSheet() {
    showModalBottomSheet(context: context, builder: _bulidBottomSheet);
  }

  Widget _chooseType() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Card(
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("已选类别："),
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Text(_list[index].name),
                        Text(_list[index].desc),
                        IconButton(
                          icon: Icon(Icons.remove_circle, color: Colors.green),
                          onPressed: () {
                            setState(() {
                              _list.removeAt(index);
                              if (_list.length == 0) {
                                show = false;
                              }
                            });
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    );
                  },
                  itemCount: _list.length,
                  shrinkWrap: true,
                ),
                Container(
                   alignment: Alignment.center,
                    child: FlatButton(
                        onPressed: _showBottomSheet, child: Text("继续添加")))
              ],
            )),
      ),
    );
  }

  Widget _bulidBottomSheet(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        children: <Widget>[
          Text("分类"),
          Divider(),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 2,
            children: datas().map((item) => tagItem(item)).toList(),
            padding: EdgeInsets.only(left: 16, right: 16),
          ),
        ],
      ),
    );
  }

  List<TagItem> datas() {
    List<TagItem> list = [];
    TagItem tagItem = TagItem("金属", "5.75/公斤", 1);
    list.add(tagItem);
    list.add(tagItem);
    list.add(tagItem);
    list.add(tagItem);
    return list;
  }

  Widget tagItem(TagItem item) {
    return Container(
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              show = true;
              _list.add(item);
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.business_center,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(item.name), Text(item.desc)],
              ),
            ],
          )),
    );
  }
}

class TagItem {
  String name;
  String desc;
  int type;

  TagItem(this.name, this.desc, this.type);
}
