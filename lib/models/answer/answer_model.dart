import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_model.freezed.dart';
part 'answer_model.g.dart';

@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    int? answerId,
    int? questionId,
    int? userId,
    String? answerText,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}
