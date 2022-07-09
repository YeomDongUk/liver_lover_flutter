part of 'survey_groups_cubit.dart';

abstract class SurveyGroupsState extends Equatable {
  const SurveyGroupsState({this.groups = const []});
  final List<SurveyGroup> groups;
  @override
  List<Object> get props => [groups];
}

class SurveyGroupsInitial extends SurveyGroupsState {
  const SurveyGroupsInitial();
}

class SurveyGroupsLoadInProgress extends SurveyGroupsState {
  const SurveyGroupsLoadInProgress({super.groups});
}

class SurveyGroupsLoadSuccess extends SurveyGroupsState {
  const SurveyGroupsLoadSuccess({super.groups});
}

class SurveyGroupsLoadFailure extends SurveyGroupsState {
  const SurveyGroupsLoadFailure();
}

class SurveyGroupsAdded extends SurveyGroupsState {
  const SurveyGroupsAdded({super.groups});
}

class SurveyGroupsUpdated extends SurveyGroupsState {
  const SurveyGroupsUpdated({super.groups});
}

class SurveyGroupsDeleted extends SurveyGroupsState {
  const SurveyGroupsDeleted({super.groups});
}
