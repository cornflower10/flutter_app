import 'package:json_annotation/json_annotation.dart';

part 'homebanner.g.dart';


@JsonSerializable()
class homebanner {

  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'message')
  String message;

  homebanner(this.success,this.code,this.data,this.message,);

  factory homebanner.fromJson(Map<String, dynamic> srcJson) => _$homebannerFromJson(srcJson);

}


@JsonSerializable()
class Data{

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

}


