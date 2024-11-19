// lib/models/question_option_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_option_model.freezed.dart';
part 'question_option_model.g.dart';

@freezed
class QuestionOptionModel with _$QuestionOptionModel {
  const factory QuestionOptionModel({
    int? optionId,
    int? questionId,
    String? optionText,
  }) = _QuestionOptionModel;

  factory QuestionOptionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionOptionModelFromJson(json);
}
