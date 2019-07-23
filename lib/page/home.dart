import 'package:flutter/material.dart';
import 'package:flutter_app/LoginPage.dart';
import 'package:flutter_app/page/SortTrash.dart';
import 'package:flutter_app/utils/TextEllipsis.dart';
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
  final String imageUrl = "http://via.placeholder.com/350x150";

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
      body: body(),
      backgroundColor: Colors.white,
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
    );
  }

  Widget body() {
    return NestedScrollView(
      headerSliverBuilder: _headerSliverBuilder,
      body: TabBarView(
        children: [artcle(), Text("--")],
        controller: tabController,
      ),
    );
  }

  artcle() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: _itemBuilder,
      itemCount: 20,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index.isOdd) return Divider();
    return InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                height: 80,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextEllipsis(
                      "sjf.sjdf大立科技冯拉进来的控件来收费吉利丁粉的控件分开的吉利丁粉的控件分开的吉利丁粉的控件分开的吉利丁粉的控件分开的",
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: TextEllipsis(
                        "sjf.sjdf大立科技冯拉进来的控件来收费吉利丁粉的控件分开的吉利丁粉的控件分开的吉利丁粉的控件分开的吉利丁粉的控件分开的",
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.only(right: 16),
                    height: 80,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )))
          ],
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });
  }

  Widget _middle() {
    return Container(
        height: 90,
        padding: EdgeInsets.only(left: 25, right: 25, top: 15),
        child: Row(
          children: <Widget>[
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SortTrash()));
              },
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.grey,
                      child: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 6), child: Text("分类"))
                ],
              ),
            )),
            Expanded(
                child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.green,
                    child: Icon(
                      Icons.description,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text("介绍"),
                )
              ],
            ))
          ],
        ));
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        child: SliverAppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Column(
            children: <Widget>[
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
              _middle(),
              Divider(
                height: 1,
              ), //
              TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.green,
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                isScrollable: false,
                tabs: tabs,
              ),
              Divider(
                height: 1,
              ),
            ],
          ),
          bottom: PreferredSize(
              child: Container(),
              preferredSize:
                  Size.fromHeight(statusBarHeight + 200 + 20 + 2 + 15)),
        ),
      )
    ];
  }
}
