// lib/models/diary_entry_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_entry_model.freezed.dart';
part 'diary_entry_model.g.dart';

@freezed
class DiaryEntryModel with _$DiaryEntryModel {
  const factory DiaryEntryModel({
    int? entryId,
    int? userId,
    String? date,
    String? context,
    int? emotionScore,
    String? createdAt,
    String? updatedAt,
  }) = _DiaryEntryModel;

  factory DiaryEntryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryEntryModelFromJson(json);
}
