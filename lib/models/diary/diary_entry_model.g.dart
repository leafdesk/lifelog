// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryEntryModelImpl _$$DiaryEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DiaryEntryModelImpl(
      entryId: (json['entryId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      date: json['date'] as String?,
      context: json['context'] as String?,
      emotionScore: (json['emotionScore'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$DiaryEntryModelImplToJson(
        _$DiaryEntryModelImpl instance) =>
    <String, dynamic>{
      'entryId': instance.entryId,
      'userId': instance.userId,
      'date': instance.date,
      'context': instance.context,
      'emotionScore': instance.emotionScore,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
