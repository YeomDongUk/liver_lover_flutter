part of 'medication_adherence_answers_cubit.dart';

enum MedicationAdherenceAnswersStatus {
  initial,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class MedicationAdherenceAnswersState extends Equatable {
  const MedicationAdherenceAnswersState({
    this.status = MedicationAdherenceAnswersStatus.initial,
    this.answers = const [],
  });

  final MedicationAdherenceAnswersStatus status;
  final List<MedicationAdherenceAnswer> answers;

  MedicationAdherenceAnswersState copyWith({
    MedicationAdherenceAnswersStatus? status,
    List<MedicationAdherenceAnswer>? answers,
  }) =>
      MedicationAdherenceAnswersState(
        status: status ?? this.status,
        answers: answers ?? this.answers,
      );

  @override
  List<Object> get props => [
        status,
        answers,
      ];
}
