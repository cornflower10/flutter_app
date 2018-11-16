import 'package:json_annotation/json_annotation.dart';

part 'githubuser.g.dart';

//flutter packages pub run build_runner build
@JsonSerializable()
class githubuser extends Object {

  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'message')
  String message;

  githubuser(this.success,this.code,this.data,this.message,);

  factory githubuser.fromJson(Map<String, dynamic> srcJson) => _$githubuserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$githubuserToJson(this);

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


