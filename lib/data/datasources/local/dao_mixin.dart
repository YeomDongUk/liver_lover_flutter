// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

mixin DaoMixin on DatabaseAccessor<AppDatabase> {
  /// 유저 테이블
  late final users = attachedDatabase.users;

  /// 약품 테이블
  late final pills = attachedDatabase.pills;

  /// 외래/검진 일정 테이블
  late final hospitalVisitSchedules = attachedDatabase.hospitalVisitSchedules;

  /// 간 수치 히스토리 테이블
  late final liverLevelHistories = attachedDatabase.liverLevelHistories;

  /// 포인트 히스토리 테이블
  late final pointHistories = attachedDatabase.pointHistories;

  /// SF12 설문 조사 히스토리 테이블
  late final sF12SurveyHistories = attachedDatabase.sF12SurveyHistories;

  /// 복약순응도 설문 조사 히스토리 테이블
  late final medicationAdherenceSurveyHistories =
      attachedDatabase.medicationAdherenceSurveyHistories;

  /// SF12 설문 조사 응답 테이블
  late final sF12SurveyAnswers = attachedDatabase.sF12SurveyAnswers;

  /// 질병 테이블
  late final metabolicDiseases = attachedDatabase.metabolicDiseases;

  /// 검사 결과 테이블
  late final examinationResults = attachedDatabase.examinationResults;

  /// 건강 질문 테이블
  late final healthQuestions = attachedDatabase.healthQuestions;

  /// 음주 히스토리 테이블
  late final drinkingHistories = attachedDatabase.drinkingHistories;

  /// 흡연 히스토리 테이블
  late final smokingHistories = attachedDatabase.smokingHistories;

  /// 운동 히스토리 테이블
  late final excerciseHistories = attachedDatabase.excerciseHistories;

  /// 병원 목록 테이블
  late final hospitals = attachedDatabase.hospitals;

  /// 복약 순응도 설문 응답 테이블
  late final medicationAdherenceSurveyAnswers =
      attachedDatabase.medicationAdherenceSurveyAnswers;

  /// 유저 포인트 테이블
  late final userPoints = attachedDatabase.userPoints;
}
