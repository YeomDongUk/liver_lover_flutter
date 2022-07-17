part of 'health_questions_cubit.dart';

abstract class HealthQuestionsState extends Equatable {
  const HealthQuestionsState({this.healthQuestions = const []});
  final List<HealthQuestion> healthQuestions;
  @override
  List<Object> get props => [healthQuestions];
}

class HealthQuestionsInitial extends HealthQuestionsState {
  const HealthQuestionsInitial();
}

class HealthQuestionsLoadInProgress extends HealthQuestionsState {
  const HealthQuestionsLoadInProgress({super.healthQuestions});
}

class HealthQuestionsLoadSuccess extends HealthQuestionsState {
  const HealthQuestionsLoadSuccess({super.healthQuestions});
}

class HealthQuestionsLoadFailure extends HealthQuestionsState {
  const HealthQuestionsLoadFailure();
}

class HealthQuestionsAddSuccess extends HealthQuestionsState {
  const HealthQuestionsAddSuccess({super.healthQuestions});
}

class HealthQuestionsUpdateSuccess extends HealthQuestionsState {
  const HealthQuestionsUpdateSuccess({super.healthQuestions});
}

class HealthQuestionsDeleteSuccess extends HealthQuestionsState {
  const HealthQuestionsDeleteSuccess({super.healthQuestions});
}
