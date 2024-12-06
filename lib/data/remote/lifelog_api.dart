import 'package:dio/dio.dart';
import 'package:lifelog/constants.dart';
import 'package:lifelog/models/user/user_model.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/models/question/question_option_model.dart';
import 'package:lifelog/models/diary/diary_entry_model.dart';
import 'package:lifelog/models/photo/photo_model.dart';
import 'package:lifelog/models/answer/answer_model.dart';
import 'package:retrofit/retrofit.dart';

part 'lifelog_api.g.dart';

@RestApi(baseUrl: Constants.localServerUrl)
abstract class LifeLogApi {
  factory LifeLogApi(Dio dio, {String baseUrl}) = _LifeLogApi;

  /// User endpoints
  @GET('/api/users/{id}')
  Future<UserModel> getUser(@Path('id') int id);

  @PUT('/api/users/{id}')
  Future<UserModel> updateUser(
      @Path('id') int id, @Body() Map<String, dynamic> user);

  @DELETE('/api/users/{id}')
  Future<void> deleteUser(@Path('id') int id);

  @POST('/api/users')
  Future<UserModel> createUser(@Body() Map<String, dynamic> user);

  /// Question Option endpoints
  @GET('/api/question-options/{id}')
  Future<QuestionOptionModel> getQuestionOption(@Path('id') int id);

  @PUT('/api/question-options/{id}')
  Future<QuestionOptionModel> updateQuestionOption(
      @Path('id') int id, @Body() Map<String, dynamic> option);

  @DELETE('/api/question-options/{id}')
  Future<void> deleteQuestionOption(@Path('id') int id);

  @POST('/api/question-options')
  Future<QuestionOptionModel> createQuestionOption(
      @Body() Map<String, dynamic> option);

  /// Photo endpoints
  @GET('/api/photo/{id}')
  Future<PhotoModel> getPhoto(@Path('id') int id);

  @PUT('/api/photo/{id}')
  Future<PhotoModel> updatePhoto(
      @Path('id') int id, @Body() Map<String, dynamic> photo);

  @DELETE('/api/photo/{id}')
  Future<void> deletePhoto(@Path('id') int id);

  @GET('/api/photo')
  Future<List<PhotoModel>> getAllPhotos();

  @POST('/api/photo')
  Future<PhotoModel> createPhoto(@Body() Map<String, dynamic> photo);

  /// Diary Entry endpoints
  @GET('/api/diary-entry/{id}')
  Future<DiaryEntryModel> getDiaryEntry(@Path('id') int id);

  @PUT('/api/diary-entry/{id}')
  Future<DiaryEntryModel> updateDiaryEntry(
      @Path('id') int id, @Body() Map<String, dynamic> entry);

  @DELETE('/api/diary-entry/{id}')
  Future<void> deleteDiaryEntry(@Path('id') int id);

  @GET('/api/diary-entry')
  Future<List<DiaryEntryModel>> getAllDiaryEntries();

  @POST('/api/diary-entry')
  Future<DiaryEntryModel> createDiaryEntry(@Body() Map<String, dynamic> entry);

  /// Custom Question endpoints
  @GET('/api/custom-questions/{id}')
  Future<QuestionModel> getCustomQuestion(@Path('id') int id);

  @PUT('/api/custom-questions/{id}')
  Future<QuestionModel> updateCustomQuestion(
      @Path('id') int id, @Body() Map<String, dynamic> question);

  @DELETE('/api/custom-questions/{id}')
  Future<void> deleteCustomQuestion(@Path('id') int id);

  @POST('/api/custom-questions')
  Future<CreateQuestionResponse> createCustomQuestion(
      @Body() Map<String, dynamic> question);

  @GET('/api/custom-questions/user/{id}')
  Future<QuestionResponse> getCustomQuestionsByUser(@Path('id') int id);

  /// Answer endpoints
  @GET('/api/answers/{id}')
  Future<AnswerModel> getAnswer(@Path('id') int id);

  @PUT('/api/answers/{id}')
  Future<AnswerModel> updateAnswer(
      @Path('id') int id, @Body() Map<String, dynamic> answer);

  @DELETE('/api/answers/{id}')
  Future<void> deleteAnswer(@Path('id') int id);

  @POST('/api/answers')
  Future<AnswerModel> createAnswer(@Body() Map<String, dynamic> answer);

  /// Statistics endpoint
  @GET('/api/statistics')
  Future<Map<String, String>> getStatistics(@Query('month') int month,
      @Query('year') int year, @Query('type') List<String> type);
}
