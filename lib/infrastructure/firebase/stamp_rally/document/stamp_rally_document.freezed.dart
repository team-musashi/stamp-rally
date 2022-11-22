// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stamp_rally_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StampRallyDocument _$StampRallyDocumentFromJson(Map<String, dynamic> json) {
  return _StampRallyDocument.fromJson(json);
}

/// @nodoc
mixin _$StampRallyDocument {
  String get title => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  int get requiredTime => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get startDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StampRallyDocumentCopyWith<StampRallyDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StampRallyDocumentCopyWith<$Res> {
  factory $StampRallyDocumentCopyWith(
          StampRallyDocument value, $Res Function(StampRallyDocument) then) =
      _$StampRallyDocumentCopyWithImpl<$Res, StampRallyDocument>;
  @useResult
  $Res call(
      {String title,
      String explanation,
      String place,
      int requiredTime,
      String imageUrl,
      @TimestampConverter() DateTime startDate,
      @TimestampConverter() DateTime? endDate});
}

/// @nodoc
class _$StampRallyDocumentCopyWithImpl<$Res, $Val extends StampRallyDocument>
    implements $StampRallyDocumentCopyWith<$Res> {
  _$StampRallyDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? explanation = null,
    Object? place = null,
    Object? requiredTime = null,
    Object? imageUrl = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
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
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StampRallyDocumentCopyWith<$Res>
    implements $StampRallyDocumentCopyWith<$Res> {
  factory _$$_StampRallyDocumentCopyWith(_$_StampRallyDocument value,
          $Res Function(_$_StampRallyDocument) then) =
      __$$_StampRallyDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String explanation,
      String place,
      int requiredTime,
      String imageUrl,
      @TimestampConverter() DateTime startDate,
      @TimestampConverter() DateTime? endDate});
}

/// @nodoc
class __$$_StampRallyDocumentCopyWithImpl<$Res>
    extends _$StampRallyDocumentCopyWithImpl<$Res, _$_StampRallyDocument>
    implements _$$_StampRallyDocumentCopyWith<$Res> {
  __$$_StampRallyDocumentCopyWithImpl(
      _$_StampRallyDocument _value, $Res Function(_$_StampRallyDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? explanation = null,
    Object? place = null,
    Object? requiredTime = null,
    Object? imageUrl = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_$_StampRallyDocument(
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
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StampRallyDocument extends _StampRallyDocument {
  const _$_StampRallyDocument(
      {required this.title,
      required this.explanation,
      required this.place,
      required this.requiredTime,
      required this.imageUrl,
      @TimestampConverter() required this.startDate,
      @TimestampConverter() this.endDate})
      : super._();

  factory _$_StampRallyDocument.fromJson(Map<String, dynamic> json) =>
      _$$_StampRallyDocumentFromJson(json);

  @override
  final String title;
  @override
  final String explanation;
  @override
  final String place;
  @override
  final int requiredTime;
  @override
  final String imageUrl;
  @override
  @TimestampConverter()
  final DateTime startDate;
  @override
  @TimestampConverter()
  final DateTime? endDate;

  @override
  String toString() {
    return 'StampRallyDocument(title: $title, explanation: $explanation, place: $place, requiredTime: $requiredTime, imageUrl: $imageUrl, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StampRallyDocument &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.requiredTime, requiredTime) ||
                other.requiredTime == requiredTime) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, explanation, place,
      requiredTime, imageUrl, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StampRallyDocumentCopyWith<_$_StampRallyDocument> get copyWith =>
      __$$_StampRallyDocumentCopyWithImpl<_$_StampRallyDocument>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StampRallyDocumentToJson(
      this,
    );
  }
}

abstract class _StampRallyDocument extends StampRallyDocument {
  const factory _StampRallyDocument(
      {required final String title,
      required final String explanation,
      required final String place,
      required final int requiredTime,
      required final String imageUrl,
      @TimestampConverter() required final DateTime startDate,
      @TimestampConverter() final DateTime? endDate}) = _$_StampRallyDocument;
  const _StampRallyDocument._() : super._();

  factory _StampRallyDocument.fromJson(Map<String, dynamic> json) =
      _$_StampRallyDocument.fromJson;

  @override
  String get title;
  @override
  String get explanation;
  @override
  String get place;
  @override
  int get requiredTime;
  @override
  String get imageUrl;
  @override
  @TimestampConverter()
  DateTime get startDate;
  @override
  @TimestampConverter()
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_StampRallyDocumentCopyWith<_$_StampRallyDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
