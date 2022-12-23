// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'env.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Env {
  /// Google Map APIキー
  String get googleMapAPIKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnvCopyWith<Env> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvCopyWith<$Res> {
  factory $EnvCopyWith(Env value, $Res Function(Env) then) =
      _$EnvCopyWithImpl<$Res, Env>;
  @useResult
  $Res call({String googleMapAPIKey});
}

/// @nodoc
class _$EnvCopyWithImpl<$Res, $Val extends Env> implements $EnvCopyWith<$Res> {
  _$EnvCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleMapAPIKey = null,
  }) {
    return _then(_value.copyWith(
      googleMapAPIKey: null == googleMapAPIKey
          ? _value.googleMapAPIKey
          : googleMapAPIKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnvCopyWith<$Res> implements $EnvCopyWith<$Res> {
  factory _$$_EnvCopyWith(_$_Env value, $Res Function(_$_Env) then) =
      __$$_EnvCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String googleMapAPIKey});
}

/// @nodoc
class __$$_EnvCopyWithImpl<$Res> extends _$EnvCopyWithImpl<$Res, _$_Env>
    implements _$$_EnvCopyWith<$Res> {
  __$$_EnvCopyWithImpl(_$_Env _value, $Res Function(_$_Env) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleMapAPIKey = null,
  }) {
    return _then(_$_Env(
      googleMapAPIKey: null == googleMapAPIKey
          ? _value.googleMapAPIKey
          : googleMapAPIKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Env extends _Env {
  const _$_Env({required this.googleMapAPIKey}) : super._();

  /// Google Map APIキー
  @override
  final String googleMapAPIKey;

  @override
  String toString() {
    return 'Env(googleMapAPIKey: $googleMapAPIKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Env &&
            (identical(other.googleMapAPIKey, googleMapAPIKey) ||
                other.googleMapAPIKey == googleMapAPIKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, googleMapAPIKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnvCopyWith<_$_Env> get copyWith =>
      __$$_EnvCopyWithImpl<_$_Env>(this, _$identity);
}

abstract class _Env extends Env {
  const factory _Env({required final String googleMapAPIKey}) = _$_Env;
  const _Env._() : super._();

  @override

  /// Google Map APIキー
  String get googleMapAPIKey;
  @override
  @JsonKey(ignore: true)
  _$$_EnvCopyWith<_$_Env> get copyWith => throw _privateConstructorUsedError;
}
