import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

// 질문 응답 모델.
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
    required int id,
    required String question,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
