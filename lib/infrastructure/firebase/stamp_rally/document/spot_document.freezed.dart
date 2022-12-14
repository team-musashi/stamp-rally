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
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get tel => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoLocation? get location => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get uploadImagePath => throw _privateConstructorUsedError;
  @TimestampConverter()
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
      String title,
      String summary,
      String? address,
      String? tel,
      String imageUrl,
      @GeoPointConverter() GeoLocation? location,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String? uploadImagePath,
      @TimestampConverter() DateTime? gotDate});

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
    Object? title = null,
    Object? summary = null,
    Object? address = freezed,
    Object? tel = freezed,
    Object? imageUrl = null,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? uploadImagePath = freezed,
    Object? gotDate = freezed,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      tel: freezed == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadImagePath: freezed == uploadImagePath
          ? _value.uploadImagePath
          : uploadImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
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
      String title,
      String summary,
      String? address,
      String? tel,
      String imageUrl,
      @GeoPointConverter() GeoLocation? location,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String? uploadImagePath,
      @TimestampConverter() DateTime? gotDate});

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
    Object? title = null,
    Object? summary = null,
    Object? address = freezed,
    Object? tel = freezed,
    Object? imageUrl = null,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? uploadImagePath = freezed,
    Object? gotDate = freezed,
  }) {
    return _then(_$_SpotDocument(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      tel: freezed == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadImagePath: freezed == uploadImagePath
          ? _value.uploadImagePath
          : uploadImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
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
      required this.title,
      required this.summary,
      this.address,
      this.tel,
      required this.imageUrl,
      @GeoPointConverter() this.location,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.uploadImagePath,
      @TimestampConverter() this.gotDate})
      : super._();

  factory _$_SpotDocument.fromJson(Map<String, dynamic> json) =>
      _$$_SpotDocumentFromJson(json);

  @override
  final int order;
  @override
  final String title;
  @override
  final String summary;
  @override
  final String? address;
  @override
  final String? tel;
  @override
  final String imageUrl;
  @override
  @GeoPointConverter()
  final GeoLocation? location;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @override
  final String? uploadImagePath;
  @override
  @TimestampConverter()
  final DateTime? gotDate;

  @override
  String toString() {
    return 'SpotDocument(order: $order, title: $title, summary: $summary, address: $address, tel: $tel, imageUrl: $imageUrl, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, uploadImagePath: $uploadImagePath, gotDate: $gotDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpotDocument &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.uploadImagePath, uploadImagePath) ||
                other.uploadImagePath == uploadImagePath) &&
            (identical(other.gotDate, gotDate) || other.gotDate == gotDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, order, title, summary, address,
      tel, imageUrl, location, createdAt, updatedAt, uploadImagePath, gotDate);

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
      required final String title,
      required final String summary,
      final String? address,
      final String? tel,
      required final String imageUrl,
      @GeoPointConverter() final GeoLocation? location,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt,
      final String? uploadImagePath,
      @TimestampConverter() final DateTime? gotDate}) = _$_SpotDocument;
  const _SpotDocument._() : super._();

  factory _SpotDocument.fromJson(Map<String, dynamic> json) =
      _$_SpotDocument.fromJson;

  @override
  int get order;
  @override
  String get title;
  @override
  String get summary;
  @override
  String? get address;
  @override
  String? get tel;
  @override
  String get imageUrl;
  @override
  @GeoPointConverter()
  GeoLocation? get location;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  String? get uploadImagePath;
  @override
  @TimestampConverter()
  DateTime? get gotDate;
  @override
  @JsonKey(ignore: true)
  _$$_SpotDocumentCopyWith<_$_SpotDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
