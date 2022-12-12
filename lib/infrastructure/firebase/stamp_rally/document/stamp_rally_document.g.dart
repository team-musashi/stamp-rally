// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'stamp_rally_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StampRallyDocument _$$_StampRallyDocumentFromJson(
        Map<String, dynamic> json) =>
    _$_StampRallyDocument(
      title: json['title'] as String,
      summary: json['summary'] as String,
      area: json['area'] as String,
      requiredTime: json['requiredTime'] as int,
      imageUrl: json['imageUrl'] as String,
      status: json['status'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Object),
      endDate: _$JsonConverterFromJson<Object, DateTime>(
          json['endDate'], const TimestampConverter().fromJson),
      createdAt: _$JsonConverterFromJson<Object, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<Object, DateTime>(
          json['updatedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_StampRallyDocumentToJson(
        _$_StampRallyDocument instance) =>
    <String, dynamic>{
      'title': instance.title,
      'summary': instance.summary,
      'area': instance.area,
      'requiredTime': instance.requiredTime,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': _$JsonConverterToJson<Object, DateTime>(
          instance.endDate, const TimestampConverter().toJson),
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
