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
      explanation: json['explanation'] as String,
      place: json['place'] as String,
      requiredTime: json['requiredTime'] as int,
      imageUrl: json['imageUrl'] as String,
      startDate: const ClientTimestampConverter()
          .fromJson(json['startDate'] as Object),
      endDate: _$JsonConverterFromJson<Object, DateTime>(
          json['endDate'], const ClientTimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_StampRallyDocumentToJson(
        _$_StampRallyDocument instance) =>
    <String, dynamic>{
      'title': instance.title,
      'explanation': instance.explanation,
      'place': instance.place,
      'requiredTime': instance.requiredTime,
      'imageUrl': instance.imageUrl,
      'startDate': const ClientTimestampConverter().toJson(instance.startDate),
      'endDate': _$JsonConverterToJson<Object, DateTime>(
          instance.endDate, const ClientTimestampConverter().toJson),
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
