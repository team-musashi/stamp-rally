// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'spot_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpotDocument _$SpotDocumentFromJson(Map<String, dynamic> json) {
  return _SpotDocument.fromJson(json);
}

/// @nodoc
mixin _$SpotDocument {
  int get order => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoLocation? get location => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get gotDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpotDocumentCopyWith<SpotDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotDocumentCopyWith<$Res> {
  factory $SpotDocumentCopyWith(
          SpotDocument value, $Res Function(SpotDocument) then) =
      _$SpotDocumentCopyWithImpl<$Res, SpotDocument>;
  @useResult
  $Res call(
      {int order,
      String imageUrl,
      @GeoPointConverter() GeoLocation? location,
      @ServerTimestampConverter() DateTime? gotDate});

  $GeoLocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$SpotDocumentCopyWithImpl<$Res, $Val extends SpotDocument>
    implements $SpotDocumentCopyWith<$Res> {
  _$SpotDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? imageUrl = null,
    Object? location = freezed,
    Object? gotDate = freezed,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation?,
      gotDate: freezed == gotDate
          ? _value.gotDate
          : gotDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoLocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $GeoLocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SpotDocumentCopyWith<$Res>
    implements $SpotDocumentCopyWith<$Res> {
  factory _$$_SpotDocumentCopyWith(
          _$_SpotDocument value, $Res Function(_$_SpotDocument) then) =
      __$$_SpotDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int order,
      String imageUrl,
      @GeoPointConverter() GeoLocation? location,
      @ServerTimestampConverter() DateTime? gotDate});

  @override
  $GeoLocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$_SpotDocumentCopyWithImpl<$Res>
    extends _$SpotDocumentCopyWithImpl<$Res, _$_SpotDocument>
    implements _$$_SpotDocumentCopyWith<$Res> {
  __$$_SpotDocumentCopyWithImpl(
      _$_SpotDocument _value, $Res Function(_$_SpotDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? imageUrl = null,
    Object? location = freezed,
    Object? gotDate = freezed,
  }) {
    return _then(_$_SpotDocument(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation?,
      gotDate: freezed == gotDate
          ? _value.gotDate
          : gotDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpotDocument extends _SpotDocument {
  const _$_SpotDocument(
      {required this.order,
      required this.imageUrl,
      @GeoPointConverter() this.location,
      @ServerTimestampConverter() this.gotDate})
      : super._();

  factory _$_SpotDocument.fromJson(Map<String, dynamic> json) =>
      _$$_SpotDocumentFromJson(json);

  @override
  final int order;
  @override
  final String imageUrl;
  @override
  @GeoPointConverter()
  final GeoLocation? location;
  @override
  @ServerTimestampConverter()
  final DateTime? gotDate;

  @override
  String toString() {
    return 'SpotDocument(order: $order, imageUrl: $imageUrl, location: $location, gotDate: $gotDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpotDocument &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.gotDate, gotDate) || other.gotDate == gotDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, order, imageUrl, location, gotDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpotDocumentCopyWith<_$_SpotDocument> get copyWith =>
      __$$_SpotDocumentCopyWithImpl<_$_SpotDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpotDocumentToJson(
      this,
    );
  }
}

abstract class _SpotDocument extends SpotDocument {
  const factory _SpotDocument(
      {required final int order,
      required final String imageUrl,
      @GeoPointConverter() final GeoLocation? location,
      @ServerTimestampConverter() final DateTime? gotDate}) = _$_SpotDocument;
  const _SpotDocument._() : super._();

  factory _SpotDocument.fromJson(Map<String, dynamic> json) =
      _$_SpotDocument.fromJson;

  @override
  int get order;
  @override
  String get imageUrl;
  @override
  @GeoPointConverter()
  GeoLocation? get location;
  @override
  @ServerTimestampConverter()
  DateTime? get gotDate;
  @override
  @JsonKey(ignore: true)
  _$$_SpotDocumentCopyWith<_$_SpotDocument> get copyWith =>
      throw _privateConstructorUsedError;
}