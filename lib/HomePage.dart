import 'package:flutter/material.dart';
import 'package:flutter_app/api/CommonService.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_app/entity/homebanner.dart';

class HomePage extends StatelessWidget{
  homebanner homeBanner ;
  @override
  Widget build(BuildContext context) {


       loadBanner();


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
            _banner()

          ],
      ),

    ),);
  }
   Widget _banner(){
    if(homeBanner!=null){
      return Container(
        margin: EdgeInsets.only(top: 16),
        height: 100,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: homeBanner.data.length,
          scrollDirection: Axis.horizontal,
          autoplay: true,

        ),
      );
    }else{
      return Center(
        child: Text('loading'),
      );
    }

   }
  Widget _swiperBuilder(BuildContext context,int index){
    return(Image.network(homeBanner.data[index].url,fit: BoxFit.fill,));
  }

  void loadBanner(){
    CommonService().getBanner((data){
       var map =  jsonDecode(data);
      homeBanner =   homebanner.fromJson(map);
     print("respose:"+homeBanner.toString());


    });
  }

}