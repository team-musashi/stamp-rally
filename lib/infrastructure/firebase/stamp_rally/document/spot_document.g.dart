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
      point: const GeoPointConverter().fromJson(json['point'] as GeoPoint),
    );

Map<String, dynamic> _$$_SpotDocumentToJson(_$_SpotDocument instance) =>
    <String, dynamic>{
      'order': instance.order,
      'imageUrl': instance.imageUrl,
      'point': const GeoPointConverter().toJson(instance.point),
    };
