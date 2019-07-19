import 'package:flutter/material.dart';
import 'package:flutter_app/HomePageFul.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
//     super.build(context);
    return  Scaffold(bottomNavigationBar: BottomNavigationBar(
      onTap: _onTap,
      items: _listItems(), currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,),
      body: PageView(physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[HomePageFul(login:false),Order(),MyAccount()],
        onPageChanged: _pageChanged,),);
  }

  _listItems() {
    List<BottomNavigationBarItem> _list =[];
    _appTabBarTitles.forEach((item) {
      _list.add(_createBottomNavigationBarItem(
          incons[_appTabBarTitles.indexOf(item)], Colors.grey, _color,
          _appTabBarTitles.indexOf(item), item));
    });

    return _list;
  }

  _createBottomNavigationBarItem(IconData icon, Color unSelect, Color select,
      int index, String tabName) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: unSelect,),
        title: Text(tabName, style:
        TextStyle(color: _currentIndex == index ? _color : unSelect)),
        activeIcon: Icon(icon, color: select,));
  }


  void _onTap(int value) {
    if(value<_appTabBarTitles.length){
      setState(() {
        _pageController.jumpToPage(value);
        _currentIndex = value;
      });
    }
  }

  void _pageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}