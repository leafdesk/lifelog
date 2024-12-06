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
  @JsonKey(name: 'entry_id')
  int? get entryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'emotion_score')
  String? get emotionScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'entry_id') int? entryId,
      @JsonKey(name: 'user_id') int? userId,
      String? date,
      String? content,
      @JsonKey(name: 'emotion_score') String? emotionScore,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
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
    Object? entryId = freezed,
    Object? userId = freezed,
    Object? date = freezed,
    Object? content = freezed,
    Object? emotionScore = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      entryId: freezed == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      emotionScore: freezed == emotionScore
          ? _value.emotionScore
          : emotionScore // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'entry_id') int? entryId,
      @JsonKey(name: 'user_id') int? userId,
      String? date,
      String? content,
      @JsonKey(name: 'emotion_score') String? emotionScore,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
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
    Object? entryId = freezed,
    Object? userId = freezed,
    Object? date = freezed,
    Object? content = freezed,
    Object? emotionScore = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DiaryEntryModelImpl(
      entryId: freezed == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      emotionScore: freezed == emotionScore
          ? _value.emotionScore
          : emotionScore // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryEntryModelImpl implements _DiaryEntryModel {
  const _$DiaryEntryModelImpl(
      {@JsonKey(name: 'entry_id') this.entryId,
      @JsonKey(name: 'user_id') this.userId,
      this.date,
      this.content,
      @JsonKey(name: 'emotion_score') this.emotionScore,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$DiaryEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryEntryModelImplFromJson(json);

  @override
  @JsonKey(name: 'entry_id')
  final int? entryId;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  final String? date;
  @override
  final String? content;
  @override
  @JsonKey(name: 'emotion_score')
  final String? emotionScore;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'DiaryEntryModel(entryId: $entryId, userId: $userId, date: $date, content: $content, emotionScore: $emotionScore, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryEntryModelImpl &&
            (identical(other.entryId, entryId) || other.entryId == entryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.emotionScore, emotionScore) ||
                other.emotionScore == emotionScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, entryId, userId, date, content,
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
          {@JsonKey(name: 'entry_id') final int? entryId,
          @JsonKey(name: 'user_id') final int? userId,
          final String? date,
          final String? content,
          @JsonKey(name: 'emotion_score') final String? emotionScore,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt}) =
      _$DiaryEntryModelImpl;

  factory _DiaryEntryModel.fromJson(Map<String, dynamic> json) =
      _$DiaryEntryModelImpl.fromJson;

  @override
  @JsonKey(name: 'entry_id')
  int? get entryId;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  String? get date;
  @override
  String? get content;
  @override
  @JsonKey(name: 'emotion_score')
  String? get emotionScore;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DiaryEntryModelImplCopyWith<_$DiaryEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
