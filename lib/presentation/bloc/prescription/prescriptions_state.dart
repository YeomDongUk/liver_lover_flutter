part of 'prescriptions_cubit.dart';

enum PrescriptionsStatus {
  initial,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class PrescriptionsState extends Equatable {
  const PrescriptionsState({
    this.status = PrescriptionsStatus.initial,
    this.prescriptions = const [],
  });

  final PrescriptionsStatus status;
  final List<Prescription> prescriptions;

  PrescriptionsState copyWith({
    PrescriptionsStatus? status,
    List<Prescription>? prescriptions,
  }) =>
      PrescriptionsState(
        status: status ?? this.status,
        prescriptions: prescriptions ?? this.prescriptions,
      );

  @override
  List<Object> get props => [
        status,
        prescriptions,
      ];
}
