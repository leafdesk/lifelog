// lib/models/diary_entry_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_entry_model.freezed.dart';
part 'diary_entry_model.g.dart';

@freezed
class DiaryEntryModel with _$DiaryEntryModel {
  const factory DiaryEntryModel({
    required int entryId,
    required int userId,
    required String date,
    required String context,
    required int emotionScore,
    required String createdAt,
    required String updatedAt,
  }) = _DiaryEntryModel;

  factory DiaryEntryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryEntryModelFromJson(json);
}
