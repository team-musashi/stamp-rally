// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventDocument _$EventDocumentFromJson(Map<String, dynamic> json) {
  return _EventDocument.fromJson(json);
}

/// @nodoc
mixin _$EventDocument {
  String get uid => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventDocumentCopyWith<EventDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDocumentCopyWith<$Res> {
  factory $EventDocumentCopyWith(
          EventDocument value, $Res Function(EventDocument) then) =
      _$EventDocumentCopyWithImpl<$Res, EventDocument>;
  @useResult
  $Res call(
      {String uid,
      String eventType,
      Map<String, dynamic> data,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$EventDocumentCopyWithImpl<$Res, $Val extends EventDocument>
    implements $EventDocumentCopyWith<$Res> {
  _$EventDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? eventType = null,
    Object? data = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventDocumentCopyWith<$Res>
    implements $EventDocumentCopyWith<$Res> {
  factory _$$_EventDocumentCopyWith(
          _$_EventDocument value, $Res Function(_$_EventDocument) then) =
      __$$_EventDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String eventType,
      Map<String, dynamic> data,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$$_EventDocumentCopyWithImpl<$Res>
    extends _$EventDocumentCopyWithImpl<$Res, _$_EventDocument>
    implements _$$_EventDocumentCopyWith<$Res> {
  __$$_EventDocumentCopyWithImpl(
      _$_EventDocument _value, $Res Function(_$_EventDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? eventType = null,
    Object? data = null,
    Object? createdAt = null,
  }) {
    return _then(_$_EventDocument(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventDocument implements _EventDocument {
  _$_EventDocument(
      {required this.uid,
      required this.eventType,
      required final Map<String, dynamic> data,
      @TimestampConverter() required this.createdAt})
      : _data = data;

  factory _$_EventDocument.fromJson(Map<String, dynamic> json) =>
      _$$_EventDocumentFromJson(json);

  @override
  final String uid;
  @override
  final String eventType;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventDocument(uid: $uid, eventType: $eventType, data: $data, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventDocument &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, eventType,
      const DeepCollectionEquality().hash(_data), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventDocumentCopyWith<_$_EventDocument> get copyWith =>
      __$$_EventDocumentCopyWithImpl<_$_EventDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventDocumentToJson(
      this,
    );
  }
}

abstract class _EventDocument implements EventDocument {
  factory _EventDocument(
          {required final String uid,
          required final String eventType,
          required final Map<String, dynamic> data,
          @TimestampConverter() required final DateTime createdAt}) =
      _$_EventDocument;

  factory _EventDocument.fromJson(Map<String, dynamic> json) =
      _$_EventDocument.fromJson;

  @override
  String get uid;
  @override
  String get eventType;
  @override
  Map<String, dynamic> get data;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_EventDocumentCopyWith<_$_EventDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
