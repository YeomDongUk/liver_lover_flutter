// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/survey/survey_group.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_histories.dart';
import 'package:yak/presentation/bloc/on_user_cubit.dart';

part 'survey_groups_state.dart';

class SurveyGroupsCubit extends Cubit<SurveyGroupsState>
    implements IonUserCubit {
  SurveyGroupsCubit({
    required this.getSurveyGroupHistories,
  }) : super(const SurveyGroupsInitial());

  final GetSurveyGroupHistories getSurveyGroupHistories;
  StreamSubscription<List<SurveyGroup>>? _surveyGroupsSubscription;

  Future<void> loadSurveyGroups() async {
    emit(const SurveyGroupsLoadInProgress());

    final either = await getSurveyGroupHistories.call(null);

    either.fold(
      (l) => emit(const SurveyGroupsLoadFailure()),
      (r) {
        _surveyGroupsSubscription?.cancel();
        _surveyGroupsSubscription = r.listen(
          (surveyGroups) => emit(
            SurveyGroupsLoadSuccess(groups: surveyGroups),
          ),
        );
      },
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

  List<SurveyGroup> get _groups => List<SurveyGroup>.from(state.groups);

  @override
  void onLogout() => emit(const SurveyGroupsInitial());
}
