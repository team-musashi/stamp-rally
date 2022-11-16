// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Spot {
  /// ドキュメントID
  String get id => throw _privateConstructorUsedError;

  /// 場所を回る順番
  int get title => throw _privateConstructorUsedError;

  /// 画像URL
  String get imageUrl => throw _privateConstructorUsedError;

  /// 開催開始日
  GeoPoint get point => throw _privateConstructorUsedError;

  /// スタンプ取得日
  DateTime? get gotDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpotCopyWith<Spot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotCopyWith<$Res> {
  factory $SpotCopyWith(Spot value, $Res Function(Spot) then) =
      _$SpotCopyWithImpl<$Res, Spot>;
  @useResult
  $Res call(
      {String id,
      int title,
      String imageUrl,
      GeoPoint point,
      DateTime? gotDate});
}

/// @nodoc
class _$SpotCopyWithImpl<$Res, $Val extends Spot>
    implements $SpotCopyWith<$Res> {
  _$SpotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? point = null,
    Object? gotDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      gotDate: freezed == gotDate
          ? _value.gotDate
          : gotDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpotCopyWith<$Res> implements $SpotCopyWith<$Res> {
  factory _$$_SpotCopyWith(_$_Spot value, $Res Function(_$_Spot) then) =
      __$$_SpotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int title,
      String imageUrl,
      GeoPoint point,
      DateTime? gotDate});
}

/// @nodoc
class __$$_SpotCopyWithImpl<$Res> extends _$SpotCopyWithImpl<$Res, _$_Spot>
    implements _$$_SpotCopyWith<$Res> {
  __$$_SpotCopyWithImpl(_$_Spot _value, $Res Function(_$_Spot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? point = null,
    Object? gotDate = freezed,
  }) {
    return _then(_$_Spot(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      gotDate: freezed == gotDate
          ? _value.gotDate
          : gotDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Spot implements _Spot {
  const _$_Spot(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.point,
      this.gotDate});

  /// ドキュメントID
  @override
  final String id;

  /// 場所を回る順番
  @override
  final int title;

  /// 画像URL
  @override
  final String imageUrl;

  /// 開催開始日
  @override
  final GeoPoint point;

  /// スタンプ取得日
  @override
  final DateTime? gotDate;

  @override
  String toString() {
    return 'Spot(id: $id, title: $title, imageUrl: $imageUrl, point: $point, gotDate: $gotDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Spot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.gotDate, gotDate) || other.gotDate == gotDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, imageUrl, point, gotDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpotCopyWith<_$_Spot> get copyWith =>
      __$$_SpotCopyWithImpl<_$_Spot>(this, _$identity);
}

abstract class _Spot implements Spot {
  const factory _Spot(
      {required final String id,
      required final int title,
      required final String imageUrl,
      required final GeoPoint point,
      final DateTime? gotDate}) = _$_Spot;

  @override

  /// ドキュメントID
  String get id;
  @override

  /// 場所を回る順番
  int get title;
  @override

  /// 画像URL
  String get imageUrl;
  @override

  /// 開催開始日
  GeoPoint get point;
  @override

  /// スタンプ取得日
  DateTime? get gotDate;
  @override
  @JsonKey(ignore: true)
  _$$_SpotCopyWith<_$_Spot> get copyWith => throw _privateConstructorUsedError;
}
