// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerModelImpl _$$AnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$AnswerModelImpl(
      answerId: (json['answer_id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      answerText: json['answer_text'] as String?,
      questionText: json['question_text'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AnswerModelImplToJson(_$AnswerModelImpl instance) =>
    <String, dynamic>{
      'answer_id': instance.answerId,
      'question_id': instance.questionId,
      'user_id': instance.userId,
      'answer_text': instance.answerText,
      'question_text': instance.questionText,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
