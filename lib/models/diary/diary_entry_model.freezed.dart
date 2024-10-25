// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiaryEntryModel _$DiaryEntryModelFromJson(Map<String, dynamic> json) {
  return _DiaryEntryModel.fromJson(json);
}

/// @nodoc
mixin _$DiaryEntryModel {
  int get entryId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;
  int get emotionScore => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryEntryModelCopyWith<DiaryEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryEntryModelCopyWith<$Res> {
  factory $DiaryEntryModelCopyWith(
          DiaryEntryModel value, $Res Function(DiaryEntryModel) then) =
      _$DiaryEntryModelCopyWithImpl<$Res, DiaryEntryModel>;
  @useResult
  $Res call(
      {int entryId,
      int userId,
      String date,
      String context,
      int emotionScore,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$DiaryEntryModelCopyWithImpl<$Res, $Val extends DiaryEntryModel>
    implements $DiaryEntryModelCopyWith<$Res> {
  _$DiaryEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryId = null,
    Object? userId = null,
    Object? date = null,
    Object? context = null,
    Object? emotionScore = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      entryId: null == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      emotionScore: null == emotionScore
          ? _value.emotionScore
          : emotionScore // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryEntryModelImplCopyWith<$Res>
    implements $DiaryEntryModelCopyWith<$Res> {
  factory _$$DiaryEntryModelImplCopyWith(_$DiaryEntryModelImpl value,
          $Res Function(_$DiaryEntryModelImpl) then) =
      __$$DiaryEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int entryId,
      int userId,
      String date,
      String context,
      int emotionScore,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$DiaryEntryModelImplCopyWithImpl<$Res>
    extends _$DiaryEntryModelCopyWithImpl<$Res, _$DiaryEntryModelImpl>
    implements _$$DiaryEntryModelImplCopyWith<$Res> {
  __$$DiaryEntryModelImplCopyWithImpl(
      _$DiaryEntryModelImpl _value, $Res Function(_$DiaryEntryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryId = null,
    Object? userId = null,
    Object? date = null,
    Object? context = null,
    Object? emotionScore = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DiaryEntryModelImpl(
      entryId: null == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      emotionScore: null == emotionScore
          ? _value.emotionScore
          : emotionScore // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryEntryModelImpl implements _DiaryEntryModel {
  const _$DiaryEntryModelImpl(
      {required this.entryId,
      required this.userId,
      required this.date,
      required this.context,
      required this.emotionScore,
      required this.createdAt,
      required this.updatedAt});

  factory _$DiaryEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryEntryModelImplFromJson(json);

  @override
  final int entryId;
  @override
  final int userId;
  @override
  final String date;
  @override
  final String context;
  @override
  final int emotionScore;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'DiaryEntryModel(entryId: $entryId, userId: $userId, date: $date, context: $context, emotionScore: $emotionScore, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryEntryModelImpl &&
            (identical(other.entryId, entryId) || other.entryId == entryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.emotionScore, emotionScore) ||
                other.emotionScore == emotionScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, entryId, userId, date, context,
      emotionScore, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryEntryModelImplCopyWith<_$DiaryEntryModelImpl> get copyWith =>
      __$$DiaryEntryModelImplCopyWithImpl<_$DiaryEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryEntryModelImplToJson(
      this,
    );
  }
}

abstract class _DiaryEntryModel implements DiaryEntryModel {
  const factory _DiaryEntryModel(
      {required final int entryId,
      required final int userId,
      required final String date,
      required final String context,
      required final int emotionScore,
      required final String createdAt,
      required final String updatedAt}) = _$DiaryEntryModelImpl;

  factory _DiaryEntryModel.fromJson(Map<String, dynamic> json) =
      _$DiaryEntryModelImpl.fromJson;

  @override
  int get entryId;
  @override
  int get userId;
  @override
  String get date;
  @override
  String get context;
  @override
  int get emotionScore;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DiaryEntryModelImplCopyWith<_$DiaryEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
