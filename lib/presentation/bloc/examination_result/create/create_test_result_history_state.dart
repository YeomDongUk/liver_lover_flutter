part of 'create_test_result_history_cubit.dart';

class CreateExcerciseHistoryState extends Equatable {
  const CreateExcerciseHistoryState({
    this.status = FormzStatus.pure,
    this.minuite,
    this.weight,
  });

  final FormzStatus status;
  final int? minuite;
  final double? weight;

  CreateExcerciseHistoryState copywith({
    FormzStatus? status,
    int? minuite,
    double? weight,
  }) =>
      CreateExcerciseHistoryState(
        status: status ?? this.status,
        minuite: minuite ?? this.minuite,
        weight: weight ?? this.weight,
      );

  @override
  List<Object?> get props => [
        status,
        minuite,
        weight,
      ];
}
