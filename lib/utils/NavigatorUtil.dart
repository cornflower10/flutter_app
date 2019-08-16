import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/BaseBloc.dart';

class NavigatorUtil {
  static void pushPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void pushPageProvidr<T extends BaseBloc >(BuildContext context, Widget page,T t) {
   pushPage(context, BlocProvider<T>(bloc: t, child: page));
  }
}
