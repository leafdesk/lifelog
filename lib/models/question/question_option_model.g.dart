// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionOptionModelImpl _$$QuestionOptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionOptionModelImpl(
      optionId: (json['optionId'] as num?)?.toInt(),
      questionId: (json['questionId'] as num?)?.toInt(),
      optionText: json['optionText'] as String?,
    );

Map<String, dynamic> _$$QuestionOptionModelImplToJson(
        _$QuestionOptionModelImpl instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'questionId': instance.questionId,
      'optionText': instance.optionText,
    };
