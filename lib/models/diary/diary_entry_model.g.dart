// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryEntryModelImpl _$$DiaryEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DiaryEntryModelImpl(
      entryId: (json['entry_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      date: json['date'] as String?,
      content: json['content'] as String?,
      emotionScore: json['emotion_score'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$DiaryEntryModelImplToJson(
        _$DiaryEntryModelImpl instance) =>
    <String, dynamic>{
      'entry_id': instance.entryId,
      'user_id': instance.userId,
      'date': instance.date,
      'content': instance.content,
      'emotion_score': instance.emotionScore,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
