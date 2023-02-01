// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDocument _$$_UserDocumentFromJson(Map<String, dynamic> json) =>
    _$_UserDocument(
      region: json['region'] as String?,
      authProvider: json['authProvider'] as String?,
      platform: json['platform'] as String?,
      createdAt: _$JsonConverterFromJson<Object, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<Object, DateTime>(
          json['updatedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_UserDocumentToJson(_$_UserDocument instance) =>
    <String, dynamic>{
      'region': instance.region,
      'authProvider': instance.authProvider,
      'platform': instance.platform,
      'createdAt': _$JsonConverterToJson<Object, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'updatedAt': _$JsonConverterToJson<Object, DateTime>(
          instance.updatedAt, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
