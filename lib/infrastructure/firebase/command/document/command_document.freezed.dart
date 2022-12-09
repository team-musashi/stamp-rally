// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'command_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommandDocument _$CommandDocumentFromJson(Map<String, dynamic> json) {
  return _CommandDocument.fromJson(json);
}

/// @nodoc
mixin _$CommandDocument {
  String get uid => throw _privateConstructorUsedError;
  String get commandType => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommandDocumentCopyWith<CommandDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandDocumentCopyWith<$Res> {
  factory $CommandDocumentCopyWith(
          CommandDocument value, $Res Function(CommandDocument) then) =
      _$CommandDocumentCopyWithImpl<$Res, CommandDocument>;
  @useResult
  $Res call(
      {String uid,
      String commandType,
      Map<String, dynamic> data,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$CommandDocumentCopyWithImpl<$Res, $Val extends CommandDocument>
    implements $CommandDocumentCopyWith<$Res> {
  _$CommandDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? commandType = null,
    Object? data = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      commandType: null == commandType
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommandDocumentCopyWith<$Res>
    implements $CommandDocumentCopyWith<$Res> {
  factory _$$_CommandDocumentCopyWith(
          _$_CommandDocument value, $Res Function(_$_CommandDocument) then) =
      __$$_CommandDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String commandType,
      Map<String, dynamic> data,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$_CommandDocumentCopyWithImpl<$Res>
    extends _$CommandDocumentCopyWithImpl<$Res, _$_CommandDocument>
    implements _$$_CommandDocumentCopyWith<$Res> {
  __$$_CommandDocumentCopyWithImpl(
      _$_CommandDocument _value, $Res Function(_$_CommandDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? commandType = null,
    Object? data = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_CommandDocument(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      commandType: null == commandType
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommandDocument implements _CommandDocument {
  _$_CommandDocument(
      {required this.uid,
      required this.commandType,
      required final Map<String, dynamic> data,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt})
      : _data = data;

  factory _$_CommandDocument.fromJson(Map<String, dynamic> json) =>
      _$$_CommandDocumentFromJson(json);

  @override
  final String uid;
  @override
  final String commandType;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CommandDocument(uid: $uid, commandType: $commandType, data: $data, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommandDocument &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.commandType, commandType) ||
                other.commandType == commandType) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, commandType,
      const DeepCollectionEquality().hash(_data), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommandDocumentCopyWith<_$_CommandDocument> get copyWith =>
      __$$_CommandDocumentCopyWithImpl<_$_CommandDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommandDocumentToJson(
      this,
    );
  }
}

abstract class _CommandDocument implements CommandDocument {
  factory _CommandDocument(
      {required final String uid,
      required final String commandType,
      required final Map<String, dynamic> data,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt}) = _$_CommandDocument;

  factory _CommandDocument.fromJson(Map<String, dynamic> json) =
      _$_CommandDocument.fromJson;

  @override
  String get uid;
  @override
  String get commandType;
  @override
  Map<String, dynamic> get data;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_CommandDocumentCopyWith<_$_CommandDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
