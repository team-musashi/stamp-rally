// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'spot_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpotDocument _$$_SpotDocumentFromJson(Map<String, dynamic> json) =>
    _$_SpotDocument(
      order: json['order'] as int,
      imageUrl: json['imageUrl'] as String,
      location: _$JsonConverterFromJson<Object, GeoLocation>(
          json['location'], const GeoPointConverter().fromJson),
      gotDate: _$JsonConverterFromJson<Object, DateTime>(
          json['gotDate'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_SpotDocumentToJson(_$_SpotDocument instance) =>
    <String, dynamic>{
      'order': instance.order,
      'imageUrl': instance.imageUrl,
      'location': _$JsonConverterToJson<Object, GeoLocation>(
          instance.location, const GeoPointConverter().toJson),
      'gotDate': _$JsonConverterToJson<Object, DateTime>(
          instance.gotDate, const TimestampConverter().toJson),
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
