import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final List<Tab> tabs = [
    Tab(text: "最新文章"),
    Tab(text: "新闻通知"),
  ];
  TabController tabController;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    tabController = new TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Swiper(
              itemCount: 2,
              itemBuilder: _swiperBuilder,
              pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
              autoplay: true,
              scrollDirection: Axis.horizontal,
              controller: new SwiperController(),
            ),
          ),
          Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 16, bottom: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.dashboard,
                        color: Colors.grey,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 6), child: Text("分类"))
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.description,
                        color: Colors.green,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text("介绍"),
                      )
                    ],
                  ))
                ],
              )),


              TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.green,
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                isScrollable: false,
                tabs: tabs,
              ),
               TabBarView(
                children: [artcle(),artcle()],
                controller: tabController,
              )


        ]))
      ],
    ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Image.network(
      "http://via.placeholder.com/350x150",
      fit: BoxFit.fill,
    );
  }

  artcle() {
   ListView.builder(
     scrollDirection:Axis.vertical,
     shrinkWrap: true,
      itemBuilder: _itemBuilder,
      itemCount: 2,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {}
}
