// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upload_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UploadImage {
  /// アップロードする画像のパス
  String get path => throw _privateConstructorUsedError;

  /// アップロード先の Storage のパス
  String get storagePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadImageCopyWith<UploadImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadImageCopyWith<$Res> {
  factory $UploadImageCopyWith(
          UploadImage value, $Res Function(UploadImage) then) =
      _$UploadImageCopyWithImpl<$Res, UploadImage>;
  @useResult
  $Res call({String path, String storagePath});
}

/// @nodoc
class _$UploadImageCopyWithImpl<$Res, $Val extends UploadImage>
    implements $UploadImageCopyWith<$Res> {
  _$UploadImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? storagePath = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      storagePath: null == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadImageCopyWith<$Res>
    implements $UploadImageCopyWith<$Res> {
  factory _$$_UploadImageCopyWith(
          _$_UploadImage value, $Res Function(_$_UploadImage) then) =
      __$$_UploadImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, String storagePath});
}

/// @nodoc
class __$$_UploadImageCopyWithImpl<$Res>
    extends _$UploadImageCopyWithImpl<$Res, _$_UploadImage>
    implements _$$_UploadImageCopyWith<$Res> {
  __$$_UploadImageCopyWithImpl(
      _$_UploadImage _value, $Res Function(_$_UploadImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? storagePath = null,
  }) {
    return _then(_$_UploadImage(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      storagePath: null == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UploadImage implements _UploadImage {
  const _$_UploadImage({required this.path, required this.storagePath});

  /// アップロードする画像のパス
  @override
  final String path;

  /// アップロード先の Storage のパス
  @override
  final String storagePath;

  @override
  String toString() {
    return 'UploadImage(path: $path, storagePath: $storagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadImage &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.storagePath, storagePath) ||
                other.storagePath == storagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, storagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadImageCopyWith<_$_UploadImage> get copyWith =>
      __$$_UploadImageCopyWithImpl<_$_UploadImage>(this, _$identity);
}

abstract class _UploadImage implements UploadImage {
  const factory _UploadImage(
      {required final String path,
      required final String storagePath}) = _$_UploadImage;

  @override

  /// アップロードする画像のパス
  String get path;
  @override

  /// アップロード先の Storage のパス
  String get storagePath;
  @override
  @JsonKey(ignore: true)
  _$$_UploadImageCopyWith<_$_UploadImage> get copyWith =>
      throw _privateConstructorUsedError;
}
