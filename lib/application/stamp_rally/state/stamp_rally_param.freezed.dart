// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stamp_rally_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StampRallyParam {
  /// スタンプラリーID
  String get stampRallyId => throw _privateConstructorUsedError;

  /// エンティティのキャッシュ
  StampRally? get cache => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StampRallyParamCopyWith<StampRallyParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StampRallyParamCopyWith<$Res> {
  factory $StampRallyParamCopyWith(
          StampRallyParam value, $Res Function(StampRallyParam) then) =
      _$StampRallyParamCopyWithImpl<$Res, StampRallyParam>;
  @useResult
  $Res call({String stampRallyId, StampRally? cache});

  $StampRallyCopyWith<$Res>? get cache;
}

/// @nodoc
class _$StampRallyParamCopyWithImpl<$Res, $Val extends StampRallyParam>
    implements $StampRallyParamCopyWith<$Res> {
  _$StampRallyParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stampRallyId = null,
    Object? cache = freezed,
  }) {
    return _then(_value.copyWith(
      stampRallyId: null == stampRallyId
          ? _value.stampRallyId
          : stampRallyId // ignore: cast_nullable_to_non_nullable
              as String,
      cache: freezed == cache
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as StampRally?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StampRallyCopyWith<$Res>? get cache {
    if (_value.cache == null) {
      return null;
    }

    return $StampRallyCopyWith<$Res>(_value.cache!, (value) {
      return _then(_value.copyWith(cache: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StampRallyParamCopyWith<$Res>
    implements $StampRallyParamCopyWith<$Res> {
  factory _$$_StampRallyParamCopyWith(
          _$_StampRallyParam value, $Res Function(_$_StampRallyParam) then) =
      __$$_StampRallyParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String stampRallyId, StampRally? cache});

  @override
  $StampRallyCopyWith<$Res>? get cache;
}

/// @nodoc
class __$$_StampRallyParamCopyWithImpl<$Res>
    extends _$StampRallyParamCopyWithImpl<$Res, _$_StampRallyParam>
    implements _$$_StampRallyParamCopyWith<$Res> {
  __$$_StampRallyParamCopyWithImpl(
      _$_StampRallyParam _value, $Res Function(_$_StampRallyParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stampRallyId = null,
    Object? cache = freezed,
  }) {
    return _then(_$_StampRallyParam(
      stampRallyId: null == stampRallyId
          ? _value.stampRallyId
          : stampRallyId // ignore: cast_nullable_to_non_nullable
              as String,
      cache: freezed == cache
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as StampRally?,
    ));
  }
}

/// @nodoc

class _$_StampRallyParam implements _StampRallyParam {
  const _$_StampRallyParam({required this.stampRallyId, this.cache});

  /// スタンプラリーID
  @override
  final String stampRallyId;

  /// エンティティのキャッシュ
  @override
  final StampRally? cache;

  @override
  String toString() {
    return 'StampRallyParam(stampRallyId: $stampRallyId, cache: $cache)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StampRallyParam &&
            (identical(other.stampRallyId, stampRallyId) ||
                other.stampRallyId == stampRallyId) &&
            (identical(other.cache, cache) || other.cache == cache));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stampRallyId, cache);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StampRallyParamCopyWith<_$_StampRallyParam> get copyWith =>
      __$$_StampRallyParamCopyWithImpl<_$_StampRallyParam>(this, _$identity);
}

abstract class _StampRallyParam implements StampRallyParam {
  const factory _StampRallyParam(
      {required final String stampRallyId,
      final StampRally? cache}) = _$_StampRallyParam;

  @override

  /// スタンプラリーID
  String get stampRallyId;
  @override

  /// エンティティのキャッシュ
  StampRally? get cache;
  @override
  @JsonKey(ignore: true)
  _$$_StampRallyParamCopyWith<_$_StampRallyParam> get copyWith =>
      throw _privateConstructorUsedError;
}
