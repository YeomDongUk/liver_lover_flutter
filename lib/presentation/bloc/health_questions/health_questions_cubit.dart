import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/domain/usecases/health_question/delete_health_question.dart';
import 'package:yak/domain/usecases/health_question/get_health_questions.dart';

part 'health_questions_state.dart';

class HealthQuestionsCubit extends Cubit<HealthQuestionsState> {
  HealthQuestionsCubit({
    required this.getHealthQuestions,
    required this.deleteHealthQuestion,
  }) : super(const HealthQuestionsInitial());

  final GetHealthQuestions getHealthQuestions;
  final DeleteHealthQuestion deleteHealthQuestion;

  Future<void> loadHealthQuestions() async {
    emit(const HealthQuestionsLoadInProgress());

    final either = await getHealthQuestions.call(null);

    emit(
      either.fold(
        (l) => const HealthQuestionsLoadFailure(),
        (r) => HealthQuestionsLoadSuccess(healthQuestions: r),
      ),
    );
  }

  void onCreate(HealthQuestion healthQuestion) {
    final healthQuestions = List<HealthQuestion>.from(state.healthQuestions)
      ..insert(0, healthQuestion);

    emit(HealthQuestionsAddSuccess(healthQuestions: healthQuestions));
  }

  void onUpdate(HealthQuestion healthQuestion) {
    final healthQuestions = List<HealthQuestion>.from(state.healthQuestions);

    final index = healthQuestions
        .indexWhere((element) => element.id == healthQuestion.id);

    if (index == -1) return;

    healthQuestions[index] = healthQuestion;

    emit(HealthQuestionsUpdateSuccess(healthQuestions: healthQuestions));
  }

  void onDelete(String id) {
    final healthQuestions = List<HealthQuestion>.from(state.healthQuestions)
      ..removeWhere((element) => element.id == id);

    emit(HealthQuestionsDeleteSuccess(healthQuestions: healthQuestions));
  }
}
