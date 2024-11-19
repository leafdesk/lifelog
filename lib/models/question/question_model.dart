import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    int? questionId,
    String? questionText,
    int? userId,
    String? questionType,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
