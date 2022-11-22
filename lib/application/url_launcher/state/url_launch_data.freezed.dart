// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'url_launch_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UrlLaunchData {
  String get urlString => throw _privateConstructorUsedError;
  LaunchMode get mode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UrlLaunchDataCopyWith<UrlLaunchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlLaunchDataCopyWith<$Res> {
  factory $UrlLaunchDataCopyWith(
          UrlLaunchData value, $Res Function(UrlLaunchData) then) =
      _$UrlLaunchDataCopyWithImpl<$Res, UrlLaunchData>;
  @useResult
  $Res call({String urlString, LaunchMode mode});
}

/// @nodoc
class _$UrlLaunchDataCopyWithImpl<$Res, $Val extends UrlLaunchData>
    implements $UrlLaunchDataCopyWith<$Res> {
  _$UrlLaunchDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlString = null,
    Object? mode = null,
  }) {
    return _then(_value.copyWith(
      urlString: null == urlString
          ? _value.urlString
          : urlString // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as LaunchMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UrlLaunchDataCopyWith<$Res>
    implements $UrlLaunchDataCopyWith<$Res> {
  factory _$$_UrlLaunchDataCopyWith(
          _$_UrlLaunchData value, $Res Function(_$_UrlLaunchData) then) =
      __$$_UrlLaunchDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String urlString, LaunchMode mode});
}

/// @nodoc
class __$$_UrlLaunchDataCopyWithImpl<$Res>
    extends _$UrlLaunchDataCopyWithImpl<$Res, _$_UrlLaunchData>
    implements _$$_UrlLaunchDataCopyWith<$Res> {
  __$$_UrlLaunchDataCopyWithImpl(
      _$_UrlLaunchData _value, $Res Function(_$_UrlLaunchData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlString = null,
    Object? mode = null,
  }) {
    return _then(_$_UrlLaunchData(
      urlString: null == urlString
          ? _value.urlString
          : urlString // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as LaunchMode,
    ));
  }
}

/// @nodoc

class _$_UrlLaunchData extends _UrlLaunchData {
  const _$_UrlLaunchData({required this.urlString, required this.mode})
      : super._();

  @override
  final String urlString;
  @override
  final LaunchMode mode;

  @override
  String toString() {
    return 'UrlLaunchData(urlString: $urlString, mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UrlLaunchData &&
            (identical(other.urlString, urlString) ||
                other.urlString == urlString) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, urlString, mode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UrlLaunchDataCopyWith<_$_UrlLaunchData> get copyWith =>
      __$$_UrlLaunchDataCopyWithImpl<_$_UrlLaunchData>(this, _$identity);
}

abstract class _UrlLaunchData extends UrlLaunchData {
  const factory _UrlLaunchData(
      {required final String urlString,
      required final LaunchMode mode}) = _$_UrlLaunchData;
  const _UrlLaunchData._() : super._();

  @override
  String get urlString;
  @override
  LaunchMode get mode;
  @override
  @JsonKey(ignore: true)
  _$$_UrlLaunchDataCopyWith<_$_UrlLaunchData> get copyWith =>
      throw _privateConstructorUsedError;
}
