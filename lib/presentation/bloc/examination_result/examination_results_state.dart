part of 'examination_results_cubit.dart';

enum ExaminationResultsStatus {
  none,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class ExaminationResultsState extends Equatable {
  const ExaminationResultsState({
    this.status = ExaminationResultsStatus.none,
    this.examinationResults = const [],
  });

  final ExaminationResultsStatus status;
  final List<ExaminationResult> examinationResults;

  ExaminationResultsState copyWith({
    ExaminationResultsStatus? status,
    List<ExaminationResult>? examinationResults,
  }) =>
      ExaminationResultsState(
        status: status ?? this.status,
        examinationResults: examinationResults ?? this.examinationResults,
      );

  @override
  List<Object> get props => [
        status,
        examinationResults,
      ];
}
