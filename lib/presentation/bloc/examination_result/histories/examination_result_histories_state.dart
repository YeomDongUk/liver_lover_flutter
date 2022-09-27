part of 'examination_result_histories_cubit.dart';

class ExaminationResultHistoriesState extends Equatable {
  const ExaminationResultHistoriesState({
    this.examinationResults = const [],
  });

  final List<ExaminationResult> examinationResults;

  @override
  List<Object> get props => [
        examinationResults,
      ];
}
