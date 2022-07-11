import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yak/domain/entities/survey/survey_group.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_histories.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_history.dart';
import 'package:yak/presentation/bloc/on_user_state.dart';

part 'survey_groups_state.dart';

class SurveyGroupsCubit extends Cubit<SurveyGroupsState>
    implements IonUserState {
  SurveyGroupsCubit({
    required this.getSurveyGroupHistory,
    required this.getSurveyGroupHistories,
  }) : super(const SurveyGroupsInitial());

  final GetSurveyGroupHistory getSurveyGroupHistory;
  final GetSurveyGroupHistories getSurveyGroupHistories;

  Future<void> loadSurveyGroups() async {
    emit(const SurveyGroupsLoadInProgress());

    final result = await getSurveyGroupHistories.call(null);

    return emit(
      result.fold(
        (l) => const SurveyGroupsLoadFailure(),
        (r) => SurveyGroupsLoadSuccess(groups: r),
      ),
    );
  }

  Future<void> loadSurveyGroup({
    required String hospitalVisitscheduleId,
  }) async {
    final result = await getSurveyGroupHistory.call(hospitalVisitscheduleId);

    return emit(
      result.fold(
        (l) => state,
        (r) => SurveyGroupsAdded(
          groups: _groups
            ..add(r)
            ..sort(
              (prev, curr) => prev.reseverdAt.compareTo(curr.reseverdAt),
            ),
        ),
      ),
    );
  }

  void updateSurveyGroup({
    required String hospitalVisitscheduleId,
    DateTime? reseverdAt,
    DateTime? visitedAt,
  }) {
    final groups = _groups;
    final groupIndex = groups.indexWhere(
      (e) =>
          e.medicationAdherenceSurveyHistory.hospitalVisitScheduleId ==
          hospitalVisitscheduleId,
    );

    if (groupIndex == -1) return;

    final surveyGroup = groups[groupIndex];
    groups[groupIndex] = surveyGroup.copyWith(
      reseverdAt: reseverdAt,
      visitedAt: visitedAt,
    );

    emit(
      SurveyGroupsUpdated(
        groups: groups
          ..sort(
            (prev, curr) => prev.reseverdAt.compareTo(curr.reseverdAt),
          ),
      ),
    );
  }

  void updateSF12Survey({
    required String sf12SurveyId,
  }) {
    final groups = _groups;
    final groupIndex = groups
        .indexWhere((element) => element.sf12surveyHistory.id == sf12SurveyId);
    if (groupIndex == -1) return;

    final surveyGroup = groups[groupIndex];

    groups[groupIndex] = surveyGroup.copyWith(
      sf12surveyHistory: surveyGroup.sf12surveyHistory.copyWith(done: true),
    );

    emit(
      SurveyGroupsUpdated(
        groups: groups
          ..sort(
            (prev, curr) => prev.reseverdAt.compareTo(curr.reseverdAt),
          ),
      ),
    );
  }

  void removeSurveyGroup({
    required String hospitalVisitscheduleId,
  }) {
    final groups = _groups
      ..removeWhere(
        (e) =>
            e.medicationAdherenceSurveyHistory.hospitalVisitScheduleId ==
            hospitalVisitscheduleId,
      );

    emit(SurveyGroupsDeleted(groups: groups));
  }

  List<SurveyGroup> get _groups => List<SurveyGroup>.from(state.groups);
  @override
  void onLogout() => emit(const SurveyGroupsInitial());
}
