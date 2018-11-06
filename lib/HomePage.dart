import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(body: new Container(
      color: Colors.white,
      child: Column(
          children: <Widget>[
            Image.asset('images/fund_bac.png',fit: BoxFit.cover,),
            Container(
             margin: EdgeInsets.only(top: 16),
              height: 30,
              child:
                Row(
                  children: <Widget>[
                    Expanded(child:Center(child: Text("集合计划"),),flex: 1) ,
                    Expanded(child: Center(child: Text("公募产品"),),flex: 1)
            ],
          )),
            Container(
              margin: EdgeInsets.only(top: 16),
              height: 100,
              child: Swiper(
                itemBuilder: _swiperBuilder,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                autoplay: true,

              ),
            )

          ],
      ),

    ),);
  }
  Widget _swiperBuilder(BuildContext context,int index){
    return(Image.network('http://via.placeholder.com/350x150',fit: BoxFit.fill,));
  }

}