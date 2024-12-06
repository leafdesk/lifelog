import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_entry_model.freezed.dart';
part 'diary_entry_model.g.dart';

@freezed
class DiaryEntryModel with _$DiaryEntryModel {
  const factory DiaryEntryModel({
    @JsonKey(name: 'entry_id') int? entryId,
    @JsonKey(name: 'user_id') int? userId,
    String? date,
    String? content,
    @JsonKey(name: 'emotion_score') String? emotionScore,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _DiaryEntryModel;

  factory DiaryEntryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryEntryModelFromJson(json);
}
