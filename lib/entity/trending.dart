import 'package:json_annotation/json_annotation.dart';

part 'trending.g.dart';


@JsonSerializable()
class trending extends Object {

  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'message')
  String message;

  trending(this.success,this.code,this.data,this.message,);

  factory trending.fromJson(Map<String, dynamic> srcJson) => _$trendingFromJson(srcJson);

  Map<String, dynamic> toJson() => _$trendingToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'destUrl')
  String destUrl;

  @JsonKey(name: 'destParam')
  String destParam;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'updateTime')
  int updateTime;

  Data(this.id,this.type,this.url,this.destUrl,this.destParam,this.createTime,this.updateTime,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


