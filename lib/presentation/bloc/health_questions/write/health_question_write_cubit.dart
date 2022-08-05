// Package imports:
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/domain/usecases/health_question/write_health_question.dart';

part 'health_question_write_state.dart';

class WriteHealthQuestionCubit extends Cubit<WriteHealthQuestionState> {
  WriteHealthQuestionCubit({
    required this.healthQuestion,
    required this.writeHealthQuestion,
  }) : super(
          WriteHealthQuestionState(
            question: healthQuestion?.qusetion ?? '',
          ),
        );

  final HealthQuestion? healthQuestion;
  final WriteHealthQuestion writeHealthQuestion;

  void updateQuestion(String question) => emit(
        state.copyWith(
          status: question.trim().length > 5
              ? FormzStatus.valid
              : FormzStatus.invalid,
          question: question,
        ),
      );

  Future<HealthQuestion?> submit() async {
    emit(
      state.copyWith(status: FormzStatus.submissionInProgress),
    );

    final either = await writeHealthQuestion.call(
      HealthQuestionsCompanion(
        id: healthQuestion == null
            ? const Value.absent()
            : Value(healthQuestion!.id),
        qusetion: Value(state.question),
      ),
    );

    final writedHealthQuestion = either.fold((l) => null, (r) => r);
    emit(
      state.copyWith(
        status: writedHealthQuestion == null
            ? FormzStatus.submissionFailure
            : FormzStatus.submissionSuccess,
      ),
    );

    return writedHealthQuestion;
  }
}
