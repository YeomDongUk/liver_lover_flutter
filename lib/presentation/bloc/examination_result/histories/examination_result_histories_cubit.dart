// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/examination_result/examination_result.dart';
import 'package:yak/domain/repositories/examination_result/excercise_history_repository.dart';

part 'examination_result_histories_state.dart';

class ExaminationResultHistoriesCubit
    extends Cubit<ExaminationResultHistoriesState> {
  ExaminationResultHistoriesCubit({
    required this.isBloodTest,
    required this.examinationResultRepository,
  }) : super(const ExaminationResultHistoriesState());

  final ExaminationResultRepository examinationResultRepository;
  final bool isBloodTest;

  Future<void> loadHistories() async {
    final either =
        await examinationResultRepository.getExaminationResultHistories(
      isBloodTest: isBloodTest,
    );

    return either.fold(
      (l) {
        emit(
          const ExaminationResultHistoriesState(),
        );
      },
      (r) => emit(
        ExaminationResultHistoriesState(examinationResults: r),
      ),
    );
  }
}
