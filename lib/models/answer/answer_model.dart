import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_model.freezed.dart';
part 'answer_model.g.dart';

@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    @JsonKey(name: 'answer_id') int? answerId,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}
