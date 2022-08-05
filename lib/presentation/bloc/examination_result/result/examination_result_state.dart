part of 'examination_result_cubit.dart';

enum ExaminationResultStatus {
  none,
  inProgress,
  done,
}

class ExaminationResultState extends Equatable {
  const ExaminationResultState({
    this.status = ExaminationResultStatus.none,
    this.examinationResult,
  });
  final ExaminationResultStatus status;
  final ExaminationResult? examinationResult;

  ExaminationResultState copyWith({
    ExaminationResultStatus? status,
    ExaminationResult? examinationResult,
  }) =>
      ExaminationResultState(
        status: status ?? this.status,
        examinationResult: examinationResult ?? this.examinationResult,
      );
  @override
  List<Object?> get props => [
        examinationResult,
      ];
}
