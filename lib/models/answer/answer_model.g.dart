// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerModelImpl _$$AnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$AnswerModelImpl(
      answerId: (json['answerId'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      answerText: json['answerText'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AnswerModelImplToJson(_$AnswerModelImpl instance) =>
    <String, dynamic>{
      'answerId': instance.answerId,
      'questionId': instance.questionId,
      'userId': instance.userId,
      'answerText': instance.answerText,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
