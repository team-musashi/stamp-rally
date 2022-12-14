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
  /// ID
  String get id => throw _privateConstructorUsedError;

  /// スタンプラリーID
  String get stampRallyId => throw _privateConstructorUsedError;

  /// 参加スタンプラリーのスポットかどうか
  bool get isEntry => throw _privateConstructorUsedError;

  /// スポットの順番
  int get order => throw _privateConstructorUsedError;

  /// スポットの名前
  String get title => throw _privateConstructorUsedError;

  /// スポットの概要
  String get summary => throw _privateConstructorUsedError;

  /// スポットの住所
  String? get address => throw _privateConstructorUsedError;

  /// スポットの電話番号
  String? get tel => throw _privateConstructorUsedError;

  /// 画像URL
  String get imageUrl => throw _privateConstructorUsedError;

  /// 緯度経度
  GeoLocation get location => throw _privateConstructorUsedError;

  /// 作成日時
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// 更新日時
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// アップロードしたスポット画像のURL
  String? get uploadImageUrl => throw _privateConstructorUsedError;

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
      String stampRallyId,
      bool isEntry,
      int order,
      String title,
      String summary,
      String? address,
      String? tel,
      String imageUrl,
      GeoLocation location,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? uploadImageUrl,
      DateTime? gotDate});

  $GeoLocationCopyWith<$Res> get location;
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
    Object? stampRallyId = null,
    Object? isEntry = null,
    Object? order = null,
    Object? title = null,
    Object? summary = null,
    Object? address = freezed,
    Object? tel = freezed,
    Object? imageUrl = null,
    Object? location = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? uploadImageUrl = freezed,
    Object? gotDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stampRallyId: null == stampRallyId
          ? _value.stampRallyId
          : stampRallyId // ignore: cast_nullable_to_non_nullable
              as String,
      isEntry: null == isEntry
          ? _value.isEntry
          : isEntry // ignore: cast_nullable_to_non_nullable
              as bool,
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
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadImageUrl: freezed == uploadImageUrl
          ? _value.uploadImageUrl
          : uploadImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gotDate: freezed == gotDate
          ? _value.gotDate
          : gotDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoLocationCopyWith<$Res> get location {
    return $GeoLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
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
      String stampRallyId,
      bool isEntry,
      int order,
      String title,
      String summary,
      String? address,
      String? tel,
      String imageUrl,
      GeoLocation location,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? uploadImageUrl,
      DateTime? gotDate});

  @override
  $GeoLocationCopyWith<$Res> get location;
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
    Object? stampRallyId = null,
    Object? isEntry = null,
    Object? order = null,
    Object? title = null,
    Object? summary = null,
    Object? address = freezed,
    Object? tel = freezed,
    Object? imageUrl = null,
    Object? location = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? uploadImageUrl = freezed,
    Object? gotDate = freezed,
  }) {
    return _then(_$_Spot(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stampRallyId: null == stampRallyId
          ? _value.stampRallyId
          : stampRallyId // ignore: cast_nullable_to_non_nullable
              as String,
      isEntry: null == isEntry
          ? _value.isEntry
          : isEntry // ignore: cast_nullable_to_non_nullable
              as bool,
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
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadImageUrl: freezed == uploadImageUrl
          ? _value.uploadImageUrl
          : uploadImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gotDate: freezed == gotDate
          ? _value.gotDate
          : gotDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Spot extends _Spot {
  const _$_Spot(
      {required this.id,
      required this.stampRallyId,
      required this.isEntry,
      required this.order,
      required this.title,
      required this.summary,
      this.address,
      this.tel,
      required this.imageUrl,
      required this.location,
      this.createdAt,
      this.updatedAt,
      this.uploadImageUrl,
      this.gotDate})
      : super._();

  /// ID
  @override
  final String id;

  /// スタンプラリーID
  @override
  final String stampRallyId;

  /// 参加スタンプラリーのスポットかどうか
  @override
  final bool isEntry;

  /// スポットの順番
  @override
  final int order;

  /// スポットの名前
  @override
  final String title;

  /// スポットの概要
  @override
  final String summary;

  /// スポットの住所
  @override
  final String? address;

  /// スポットの電話番号
  @override
  final String? tel;

  /// 画像URL
  @override
  final String imageUrl;

  /// 緯度経度
  @override
  final GeoLocation location;

  /// 作成日時
  @override
  final DateTime? createdAt;

  /// 更新日時
  @override
  final DateTime? updatedAt;

  /// アップロードしたスポット画像のURL
  @override
  final String? uploadImageUrl;

  /// スタンプ取得日
  @override
  final DateTime? gotDate;

  @override
  String toString() {
    return 'Spot(id: $id, stampRallyId: $stampRallyId, isEntry: $isEntry, order: $order, title: $title, summary: $summary, address: $address, tel: $tel, imageUrl: $imageUrl, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, uploadImageUrl: $uploadImageUrl, gotDate: $gotDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Spot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stampRallyId, stampRallyId) ||
                other.stampRallyId == stampRallyId) &&
            (identical(other.isEntry, isEntry) || other.isEntry == isEntry) &&
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
            (identical(other.uploadImageUrl, uploadImageUrl) ||
                other.uploadImageUrl == uploadImageUrl) &&
            (identical(other.gotDate, gotDate) || other.gotDate == gotDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      stampRallyId,
      isEntry,
      order,
      title,
      summary,
      address,
      tel,
      imageUrl,
      location,
      createdAt,
      updatedAt,
      uploadImageUrl,
      gotDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpotCopyWith<_$_Spot> get copyWith =>
      __$$_SpotCopyWithImpl<_$_Spot>(this, _$identity);
}

abstract class _Spot extends Spot {
  const factory _Spot(
      {required final String id,
      required final String stampRallyId,
      required final bool isEntry,
      required final int order,
      required final String title,
      required final String summary,
      final String? address,
      final String? tel,
      required final String imageUrl,
      required final GeoLocation location,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? uploadImageUrl,
      final DateTime? gotDate}) = _$_Spot;
  const _Spot._() : super._();

  @override

  /// ID
  String get id;
  @override

  /// スタンプラリーID
  String get stampRallyId;
  @override

  /// 参加スタンプラリーのスポットかどうか
  bool get isEntry;
  @override

  /// スポットの順番
  int get order;
  @override

  /// スポットの名前
  String get title;
  @override

  /// スポットの概要
  String get summary;
  @override

  /// スポットの住所
  String? get address;
  @override

  /// スポットの電話番号
  String? get tel;
  @override

  /// 画像URL
  String get imageUrl;
  @override

  /// 緯度経度
  GeoLocation get location;
  @override

  /// 作成日時
  DateTime? get createdAt;
  @override

  /// 更新日時
  DateTime? get updatedAt;
  @override

  /// アップロードしたスポット画像のURL
  String? get uploadImageUrl;
  @override

  /// スタンプ取得日
  DateTime? get gotDate;
  @override
  @JsonKey(ignore: true)
  _$$_SpotCopyWith<_$_Spot> get copyWith => throw _privateConstructorUsedError;
}
