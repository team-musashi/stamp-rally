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
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: const ClientTimestampConverter().fromJson(json['endDate']),
    );

Map<String, dynamic> _$$_StampRallyDocumentToJson(
        _$_StampRallyDocument instance) =>
    <String, dynamic>{
      'title': instance.title,
      'explanation': instance.explanation,
      'place': instance.place,
      'requiredTime': instance.requiredTime,
      'imageUrl': instance.imageUrl,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': const ClientTimestampConverter().toJson(instance.endDate),
    };