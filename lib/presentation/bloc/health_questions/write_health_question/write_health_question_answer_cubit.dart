// Package imports:
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/domain/usecases/health_question/update_health_question.dart';

part 'write_health_question_answer_state.dart';

class WriteHealthQuestionAnswerCubit
    extends Cubit<WriteHealthQuestionAnswerState> {
  WriteHealthQuestionAnswerCubit({
    required this.id,
    required this.updateHealthQuestion,
  }) : super(const WriteHealthQuestionAnswerState());
  final String id;
  final UpdateHealthQuestion updateHealthQuestion;

  void updateDoctorName(String doctorName) => emit(
        state.copyWith(
          status: state.answer.trim().length > 5 &&
                  state.doctorName.trim().isNotEmpty
              ? FormzStatus.valid
              : FormzStatus.invalid,
          doctorName: doctorName,
        ),
      );
  void updateAnswer(String answer) => emit(
        state.copyWith(
          status: answer.trim().length > 5 && state.doctorName.trim().isNotEmpty
              ? FormzStatus.valid
              : FormzStatus.invalid,
          answer: answer,
        ),
      );

  Future<HealthQuestion?> submit() async {
    emit(
      state.copyWith(status: FormzStatus.submissionInProgress),
    );

    final either = await updateHealthQuestion.call(
      HealthQuestionsCompanion(
        id: Value(id),
        doctorName: Value(state.doctorName),
        answer: Value(state.answer),
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
