// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'command_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommandDocument _$$_CommandDocumentFromJson(Map<String, dynamic> json) =>
    _$_CommandDocument(
      uid: json['uid'] as String,
      commandType: json['commandType'] as String,
      data: json['data'] as Map<String, dynamic>,
      createdAt: _$JsonConverterFromJson<Object, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<Object, DateTime>(
          json['updatedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_CommandDocumentToJson(_$_CommandDocument instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'commandType': instance.commandType,
      'data': instance.data,
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
