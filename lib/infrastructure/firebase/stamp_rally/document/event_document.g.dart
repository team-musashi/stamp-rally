// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'event_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventDocument _$$_EventDocumentFromJson(Map<String, dynamic> json) =>
    _$_EventDocument(
      eventType: json['eventType'] as String,
      data: json['data'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_EventDocumentToJson(_$_EventDocument instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'data': instance.data,
      'createdAt': instance.createdAt.toIso8601String(),
    };
