// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDocument _$$_UserDocumentFromJson(Map<String, dynamic> json) =>
    _$_UserDocument(
      provider: json['provider'] as String?,
      createdPlatform: json['createdPlatform'] as String?,
      createdAt: const ServerTimestampConverter().fromJson(json['createdAt']),
      updatedAt: const ServerTimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_UserDocumentToJson(_$_UserDocument instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'createdPlatform': instance.createdPlatform,
      'createdAt': const ServerTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const ServerTimestampConverter().toJson(instance.updatedAt),
    };