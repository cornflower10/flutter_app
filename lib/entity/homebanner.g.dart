// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homebanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

homebanner _$homebannerFromJson(Map<String, dynamic> json) {
  return homebanner(
      json['success'] as bool,
      json['code'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['message'] as String);
}

Map<String, dynamic> _$homebannerToJson(homebanner instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'data': instance.data,
      'message': instance.message
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['id'] as int,
      json['type'] as int,
      json['url'] as String,
      json['destUrl'] as String,
      json['destParam'] as String,
      json['createTime'] as int,
      json['updateTime'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'url': instance.url,
      'destUrl': instance.destUrl,
      'destParam': instance.destParam,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime
    };
