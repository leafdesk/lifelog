// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionResponseImpl _$$QuestionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionResponseImpl(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionResponseImplToJson(
        _$QuestionResponseImpl instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$CreateQuestionResponseImpl _$$CreateQuestionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateQuestionResponseImpl(
      questionId: (json['questionId'] as num).toInt(),
      questionText: json['questionText'] as String,
      userId: (json['userId'] as num).toInt(),
      questionType: json['questionType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CreateQuestionResponseImplToJson(
        _$CreateQuestionResponseImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'questionText': instance.questionText,
      'userId': instance.userId,
      'questionType': instance.questionType,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
