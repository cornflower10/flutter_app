import 'package:flutter/material.dart';

class SortTrash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SortState();
  }
}

class SortState extends State<SortTrash> {
  int chooseInex=0;
  List<String> data = [
    "书本",
    "书本",
    "书本",
    "书本",
    "书本",
    "书本",
    "书本",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("分类"),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: 3,
            ),
          ),
          Expanded(
              flex: 5,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                padding: EdgeInsets.only(right: 10),
                crossAxisSpacing: 0,
                childAspectRatio: 2,
                children: data.map((item) => itemWidget(item)).toList(),
              ))
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
      color: chooseInex == index ? Colors.white : Colors.black12,
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: InkWell(
        onTap: (){
          setState(() {
            chooseInex=index;
          });
        },
        child: Column(
          children: <Widget>[
            Icon(Icons.wallpaper),
            Padding(
              padding: EdgeInsets.only(
                top: 4,
              ),
              child: Text("废金属"),
            )
          ],
        ),
      ),
    );
  }

  Widget itemWidget(String data) {
    return Container(
      child: Text(
        data,
        style: TextStyle(fontSize: 12),
      ),
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
    );
  }
}
