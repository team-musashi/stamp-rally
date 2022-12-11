// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stamp_rally.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StampRally {
  /// ID
  String get id => throw _privateConstructorUsedError;

  /// スタンプラリー名称
  String get title => throw _privateConstructorUsedError;

  /// スタンプラリーの詳細説明
  String get explanation => throw _privateConstructorUsedError;

  /// 開催場所
  String get place => throw _privateConstructorUsedError;

  /// 所用時間
  int get requiredTime => throw _privateConstructorUsedError;

  /// 画像URL
  String get imageUrl => throw _privateConstructorUsedError;

  /// 参加ステータス
  String? get status => throw _privateConstructorUsedError;

  /// 開催開始日
  DateTime get startDate => throw _privateConstructorUsedError;

  /// 開催終了日
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// 作成日時
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// 更新日時
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// スタンプラリーのスポットのリスト
  List<Spot> get spots => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StampRallyCopyWith<StampRally> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StampRallyCopyWith<$Res> {
  factory $StampRallyCopyWith(
          StampRally value, $Res Function(StampRally) then) =
      _$StampRallyCopyWithImpl<$Res, StampRally>;
  @useResult
  $Res call(
      {String id,
      String title,
      String explanation,
      String place,
      int requiredTime,
      String imageUrl,
      String? status,
      DateTime startDate,
      DateTime? endDate,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<Spot> spots});
}

/// @nodoc
class _$StampRallyCopyWithImpl<$Res, $Val extends StampRally>
    implements $StampRallyCopyWith<$Res> {
  _$StampRallyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? explanation = null,
    Object? place = null,
    Object? requiredTime = null,
    Object? imageUrl = null,
    Object? status = freezed,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? spots = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      requiredTime: null == requiredTime
          ? _value.requiredTime
          : requiredTime // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      spots: null == spots
          ? _value.spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<Spot>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StampRallyCopyWith<$Res>
    implements $StampRallyCopyWith<$Res> {
  factory _$$_StampRallyCopyWith(
          _$_StampRally value, $Res Function(_$_StampRally) then) =
      __$$_StampRallyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String explanation,
      String place,
      int requiredTime,
      String imageUrl,
      String? status,
      DateTime startDate,
      DateTime? endDate,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<Spot> spots});
}

/// @nodoc
class __$$_StampRallyCopyWithImpl<$Res>
    extends _$StampRallyCopyWithImpl<$Res, _$_StampRally>
    implements _$$_StampRallyCopyWith<$Res> {
  __$$_StampRallyCopyWithImpl(
      _$_StampRally _value, $Res Function(_$_StampRally) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? explanation = null,
    Object? place = null,
    Object? requiredTime = null,
    Object? imageUrl = null,
    Object? status = freezed,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? spots = null,
  }) {
    return _then(_$_StampRally(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      requiredTime: null == requiredTime
          ? _value.requiredTime
          : requiredTime // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      spots: null == spots
          ? _value._spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<Spot>,
    ));
  }
}

/// @nodoc

class _$_StampRally implements _StampRally {
  const _$_StampRally(
      {required this.id,
      required this.title,
      required this.explanation,
      required this.place,
      required this.requiredTime,
      required this.imageUrl,
      this.status,
      required this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      final List<Spot> spots = const <Spot>[]})
      : _spots = spots;

  /// ID
  @override
  final String id;

  /// スタンプラリー名称
  @override
  final String title;

  /// スタンプラリーの詳細説明
  @override
  final String explanation;

  /// 開催場所
  @override
  final String place;

  /// 所用時間
  @override
  final int requiredTime;

  /// 画像URL
  @override
  final String imageUrl;

  /// 参加ステータス
  @override
  final String? status;

  /// 開催開始日
  @override
  final DateTime startDate;

  /// 開催終了日
  @override
  final DateTime? endDate;

  /// 作成日時
  @override
  final DateTime? createdAt;

  /// 更新日時
  @override
  final DateTime? updatedAt;

  /// スタンプラリーのスポットのリスト
  final List<Spot> _spots;

  /// スタンプラリーのスポットのリスト
  @override
  @JsonKey()
  List<Spot> get spots {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spots);
  }

  @override
  String toString() {
    return 'StampRally(id: $id, title: $title, explanation: $explanation, place: $place, requiredTime: $requiredTime, imageUrl: $imageUrl, status: $status, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, spots: $spots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StampRally &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.requiredTime, requiredTime) ||
                other.requiredTime == requiredTime) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._spots, _spots));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      explanation,
      place,
      requiredTime,
      imageUrl,
      status,
      startDate,
      endDate,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_spots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StampRallyCopyWith<_$_StampRally> get copyWith =>
      __$$_StampRallyCopyWithImpl<_$_StampRally>(this, _$identity);
}

abstract class _StampRally implements StampRally {
  const factory _StampRally(
      {required final String id,
      required final String title,
      required final String explanation,
      required final String place,
      required final int requiredTime,
      required final String imageUrl,
      final String? status,
      required final DateTime startDate,
      final DateTime? endDate,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final List<Spot> spots}) = _$_StampRally;

  @override

  /// ID
  String get id;
  @override

  /// スタンプラリー名称
  String get title;
  @override

  /// スタンプラリーの詳細説明
  String get explanation;
  @override

  /// 開催場所
  String get place;
  @override

  /// 所用時間
  int get requiredTime;
  @override

  /// 画像URL
  String get imageUrl;
  @override

  /// 参加ステータス
  String? get status;
  @override

  /// 開催開始日
  DateTime get startDate;
  @override

  /// 開催終了日
  DateTime? get endDate;
  @override

  /// 作成日時
  DateTime? get createdAt;
  @override

  /// 更新日時
  DateTime? get updatedAt;
  @override

  /// スタンプラリーのスポットのリスト
  List<Spot> get spots;
  @override
  @JsonKey(ignore: true)
  _$$_StampRallyCopyWith<_$_StampRally> get copyWith =>
      throw _privateConstructorUsedError;
}
