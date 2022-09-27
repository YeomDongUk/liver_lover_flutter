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

  // 1, 2, 3, 4, 6, 7번 문항은 1. 예는 '0점', 2. 아니오는 '1점',
  // 5번 문항은 1. 예는 '1점', 2. 아니오는 '0점',
  // 8번은 1.전혀는 '1점', 2. 드물게는 '0.75점', 3. 가끔은 '0.50점', 4. 자주는 '0.25점', 5. 언제나는 '0점'으로 해서 총 8점 만점입니다.
  double get point {
    if (answers.isEmpty) return 0;

    final withoutFiveAndEight = (answers.sublist(0, 7)..removeAt(4)).fold<int>(
      0,
      (prev, next) => prev + (next.answer == 0 ? 0 : 1),
    );

    final fivePoint = answers[4].answer == 0 ? 1 : 0;
    final eightPoint = 1 - (answers.last.answer * 0.25);

    return withoutFiveAndEight + fivePoint + eightPoint;
  }

  @override
  List<Object> get props => [
        status,
        answers,
      ];
}
