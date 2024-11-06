import 'package:dio/dio.dart';
import 'package:lifelog/constants.dart';
import 'package:lifelog/models/user/user_model.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/models/question/question_option_model.dart';
import 'package:lifelog/models/diary/diary_entry_model.dart';
import 'package:lifelog/models/photo/photo_model.dart';
import 'package:retrofit/retrofit.dart';

part 'lifelog_api.g.dart';

@RestApi(baseUrl: Constants.swaggerServerUrl)
abstract class LifeLogApi {
  factory LifeLogApi(Dio dio, {String baseUrl}) = _LifeLogApi;

  // 사용자 지정을 위한 질문 추가
  @POST('/api/custom-question')
  Future<QuestionModel> addCustomQuestion(
      @Body() Map<String, dynamic> question);

  // 사용자 지정을 위한 질문 수정
  @PUT('/api/custom-question/{question_id}')
  Future<QuestionModel> updateCustomQuestion(
      @Path("question_id") int questionId,
      @Body() Map<String, dynamic> question);

  // 사용자 지정을 위한 질문 삭제
  @DELETE('/api/custom-question/{question_id}')
  Future<void> deleteCustomQuestion(@Path("question_id") int questionId);

  // 사용자 회원가입
  @POST('/api/users')
  Future<UserModel> registerUser(@Body() Map<String, dynamic> user);

  // 사용자 정보 수정
  @PUT('/api/users/{user_id}')
  Future<UserModel> updateUser(
      @Path("user_id") String userId, @Body() Map<String, dynamic> user);

  // 사용자 정보 조회
  @GET('/api/users/{user_id}')
  Future<UserModel> getUserInfo(@Path("user_id") String userId);

  // 사용자 탈퇴
  @DELETE('/api/users/{user_id}')
  Future<void> deleteUser(@Path("user_id") String userId);

  // 사용자 지정을 위한 질문 옵션 추가
  @POST('/api/question-option')
  Future<QuestionOptionModel> addQuestionOption(
      @Body() Map<String, dynamic> option);

  // 사용자 지정을 위한 질문 옵션 수정
  @PUT('/api/question-option/{option_id}')
  Future<QuestionOptionModel> updateQuestionOption(
      @Path("option_id") int optionId, @Body() Map<String, dynamic> option);

  // 사용자 지정을 한 질문 옵션 삭제
  @DELETE('/api/question-option/{option_id}')
  Future<void> deleteQuestionOption(@Path("option_id") int optionId);

  // 일기 추가
  @POST('/api/diary-entry')
  Future<DiaryEntryModel> addDiaryEntry(@Body() Map<String, dynamic> entry);

  // 일기 수정
  @PUT('/api/diary-entry/{entry_id}')
  Future<DiaryEntryModel> updateDiaryEntry(
      @Path("entry_id") int entryId, @Body() Map<String, dynamic> entry);

  // 일기 삭제
  @DELETE('/api/diary-entry/{entry_id}')
  Future<void> deleteDiaryEntry(@Path("entry_id") int entryId);

  // 사진 추가
  @POST('/api/photo')
  Future<PhotoModel> addPhoto(@Body() Map<String, dynamic> photo);

  // 사진 수정
  @PUT('/api/photo/{photo_id}')
  Future<PhotoModel> updatePhoto(
      @Path("photo_id") int photoId, @Body() Map<String, dynamic> photo);

  // 사진 삭제
  @DELETE('/api/photo/{photo_id}')
  Future<void> deletePhoto(@Path("photo_id") int photoId);
}
