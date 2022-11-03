// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDocument _$UserDocumentFromJson(Map<String, dynamic> json) {
  return _UserDocument.fromJson(json);
}

/// @nodoc
mixin _$UserDocument {
  String? get provider => throw _privateConstructorUsedError;
  String? get createdPlatform => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDocumentCopyWith<UserDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDocumentCopyWith<$Res> {
  factory $UserDocumentCopyWith(
          UserDocument value, $Res Function(UserDocument) then) =
      _$UserDocumentCopyWithImpl<$Res, UserDocument>;
  @useResult
  $Res call(
      {String? provider,
      String? createdPlatform,
      @ServerTimestampConverter() DateTime? createdAt,
      @ServerTimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$UserDocumentCopyWithImpl<$Res, $Val extends UserDocument>
    implements $UserDocumentCopyWith<$Res> {
  _$UserDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = freezed,
    Object? createdPlatform = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      createdPlatform: freezed == createdPlatform
          ? _value.createdPlatform
          : createdPlatform // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_UserDocumentCopyWith<$Res>
    implements $UserDocumentCopyWith<$Res> {
  factory _$$_UserDocumentCopyWith(
          _$_UserDocument value, $Res Function(_$_UserDocument) then) =
      __$$_UserDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? provider,
      String? createdPlatform,
      @ServerTimestampConverter() DateTime? createdAt,
      @ServerTimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$_UserDocumentCopyWithImpl<$Res>
    extends _$UserDocumentCopyWithImpl<$Res, _$_UserDocument>
    implements _$$_UserDocumentCopyWith<$Res> {
  __$$_UserDocumentCopyWithImpl(
      _$_UserDocument _value, $Res Function(_$_UserDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = freezed,
    Object? createdPlatform = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_UserDocument(
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      createdPlatform: freezed == createdPlatform
          ? _value.createdPlatform
          : createdPlatform // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_UserDocument extends _UserDocument {
  const _$_UserDocument(
      {this.provider,
      this.createdPlatform,
      @ServerTimestampConverter() this.createdAt,
      @ServerTimestampConverter() this.updatedAt})
      : super._();

  factory _$_UserDocument.fromJson(Map<String, dynamic> json) =>
      _$$_UserDocumentFromJson(json);

  @override
  final String? provider;
  @override
  final String? createdPlatform;
  @override
  @ServerTimestampConverter()
  final DateTime? createdAt;
  @override
  @ServerTimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserDocument(provider: $provider, createdPlatform: $createdPlatform, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDocument &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.createdPlatform, createdPlatform) ||
                other.createdPlatform == createdPlatform) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, provider, createdPlatform, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDocumentCopyWith<_$_UserDocument> get copyWith =>
      __$$_UserDocumentCopyWithImpl<_$_UserDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDocumentToJson(
      this,
    );
  }
}

abstract class _UserDocument extends UserDocument {
  const factory _UserDocument(
      {final String? provider,
      final String? createdPlatform,
      @ServerTimestampConverter() final DateTime? createdAt,
      @ServerTimestampConverter() final DateTime? updatedAt}) = _$_UserDocument;
  const _UserDocument._() : super._();

  factory _UserDocument.fromJson(Map<String, dynamic> json) =
      _$_UserDocument.fromJson;

  @override
  String? get provider;
  @override
  String? get createdPlatform;
  @override
  @ServerTimestampConverter()
  DateTime? get createdAt;
  @override
  @ServerTimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserDocumentCopyWith<_$_UserDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
