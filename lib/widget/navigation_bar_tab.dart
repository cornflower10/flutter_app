import 'package:flutter/material.dart';
import 'package:flutter_app/HomePageFul.dart';
import 'package:flutter_app/blocs/BaseBloc.dart';
import 'package:flutter_app/blocs/MainBloc.dart';
import 'package:flutter_app/blocs/OrderBloc.dart';
import 'package:flutter_app/page/home.dart';
import 'package:flutter_app/page/my_account.dart';
import 'package:flutter_app/page/order.dart';
import 'package:flutter_app/utils/image_utils.dart';

class NavigationBarTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigationBarTabState();
  }
}

class NavigationBarTabState extends State<NavigationBarTab> {
  var _currentIndex = 0;
  final PageController _pageController = PageController();
  var _appTabBarTitles = ['首页', '订单', '我的'];
  var incons = [Icons.home, Icons.border_color, Icons.person];
  final Color _color = Colors.green;
  MainBloc mainBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     super.build(context);
    mainBloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        items: _listItems(),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[Home(), _order(), MyAccount()],
        onPageChanged: _pageChanged,
      ),
    );
  }

  _listItems() {
    List<BottomNavigationBarItem> _list = [];
    _appTabBarTitles.forEach((item) {
      _list.add(_createBottomNavigationBarItem(
          incons[_appTabBarTitles.indexOf(item)],
          Colors.grey,
          _appTabBarTitles.indexOf(item),
          item));
    });

    return _list;
  }

  _order() {
    return BlocProvider<OrderBloc>(bloc: OrderBloc(), child: Order());
  }

  _createBottomNavigationBarItem(
      IconData icon, Color unSelect, int index, String tabName) {
    return BottomNavigationBarItem(
        icon: StreamBuilder(
            stream: mainBloc.out,
            builder: (BuildContext context, AsyncSnapshot<int> value) {
              if (value.hasData) {
                _currentIndex = value.data;
              }
              return Icon(
                icon,
                color: _currentIndex == index ? _color : unSelect,
              );
            }),
        title: StreamBuilder(
            stream: mainBloc.out,
            builder: (BuildContext context, AsyncSnapshot<int> value) {
              if (value.hasData) {
                _currentIndex = value.data;
              }
              return Text(tabName,
                  style: TextStyle(
                      color: _currentIndex == index ? _color : unSelect));
            }),
        activeIcon: StreamBuilder(
            stream: mainBloc.out,
            builder: (BuildContext context, AsyncSnapshot<int> value) {
              if (value.hasData) {
                _currentIndex = value.data;
              }
              return Icon(
                icon,
                color: _currentIndex == index ? _color : unSelect,
              );
            }));
  }

  void _onTap(int value) {
    if (value < _appTabBarTitles.length) {
//      setState(() {
      _pageController.jumpToPage(value);
      mainBloc.changeChoose(value);
//      });
    }
  }

  void _pageChanged(int value) {
//    setState(() {
//      _currentIndex = value;
//    });
  }
}
