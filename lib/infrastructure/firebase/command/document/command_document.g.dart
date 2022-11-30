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
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_CommandDocumentToJson(_$_CommandDocument instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'commandType': instance.commandType,
      'data': instance.data,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
