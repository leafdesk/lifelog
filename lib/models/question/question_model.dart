import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionResponse with _$QuestionResponse {
  const factory QuestionResponse({
    required List<QuestionModel> questions,
  }) = _QuestionResponse;

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);
}

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    int? id,
    String? question,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

@freezed
class CreateQuestionResponse with _$CreateQuestionResponse {
  const factory CreateQuestionResponse({
    required int questionId,
    required String questionText,
    required int userId,
    required String questionType,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CreateQuestionResponse;

  factory CreateQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateQuestionResponseFromJson(json);
}
