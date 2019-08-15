import 'package:flutter_app/api/Api.dart';
import 'package:flutter_app/api/BaseData.dart';
import 'package:flutter_app/api/NetUtils.dart';
import 'package:flutter_app/entity/Banners.dart';
class IndexRepository{

  Future<List<Banners>>bannerList() async{
    BaseData<List> data = await NetUtils.getInstance().get<List>(Api.HOME_BANNER);
    List<Banners> list;
    if(data.data!=null){
      list = data.data?.map((value){
        Banners banner = Banners.fromJson(value);
        return banner;
      })?.toList();
    }
    return list;
  }
}