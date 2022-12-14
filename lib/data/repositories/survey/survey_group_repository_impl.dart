// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/survey_group/survey_group_local_data_source.dart';
import 'package:yak/domain/entities/survey/medication_adherence/medication_adherence_survey_history.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_survey_history.dart';
import 'package:yak/domain/entities/survey/survey_group.dart';
import 'package:yak/domain/repositories/survey/survey_group_repository.dart';

class SurveyGroupRepositoryImpl implements SurveyGroupRepository {
  SurveyGroupRepositoryImpl({
    required this.surveyGroupLocalDataSource,
    required this.userId,
  });

  final UserId userId;
  final SurveyGroupLocalDataSource surveyGroupLocalDataSource;

  String get _userId => userId.value;

  @override
  Either<Failure, Stream<List<SurveyGroup>>> getSurveyGroupsStream() {
    try {
      final surveyGroupsStream =
          surveyGroupLocalDataSource.getSurveyGroupsStream(userId: _userId);

      return Right(
        surveyGroupsStream.map(
          (surveyGroupModels) => surveyGroupModels
              .map(
                (surveyGroupModel) => SurveyGroup(
                  reseverdAt: surveyGroupModel.reseverdAt,
                  visitedAt: surveyGroupModel.visitedAt,
                  medicationAdherenceSurveyHistory:
                      MedicationAdherenceSurveyHistory.fromJson(
                    surveyGroupModel.medicationAdherenceSurveyHistoryModel
                        .toJson(),
                  ),
                  sf12surveyHistory: SF12SurveyHistory.fromJson(
                    surveyGroupModel.sf12surveyHistoryModel.toJson(),
                  ),
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }
}
