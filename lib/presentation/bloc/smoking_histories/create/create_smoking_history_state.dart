part of 'create_smoking_history_cubit.dart';

class CreateSmokingHistoryState extends Equatable {
  const CreateSmokingHistoryState({
    this.status = FormzStatus.pure,
    this.amount,
  });

  final FormzStatus status;
  final int? amount;

  CreateSmokingHistoryState copywith({
    FormzStatus? status,
    int? amount,
  }) =>
      CreateSmokingHistoryState(
        status: status ?? this.status,
        amount: amount ?? this.amount,
      );

  @override
  List<Object?> get props => [
        status,
        amount,
      ];
}
