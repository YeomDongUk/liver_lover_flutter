part of 'create_drinking_history_cubit.dart';

enum AlcoholType {
  soju(
    name: '소주',
    amount: 360,
    alcoholAmount: 54,
  ),
  makgeolli(
    name: '막걸리',
    amount: 750,
    alcoholAmount: 35,
  ),
  beer(
    name: '맥주',
    amount: 355,
    alcoholAmount: 12,
  ),
  wine(
    name: '와인',
    amount: 700,
    alcoholAmount: 66,
  ),
  wisky(
    name: '위스키',
    amount: 360,
    alcoholAmount: 113,
  );

  const AlcoholType({
    required this.name,
    required this.amount,
    required this.alcoholAmount,
  });
  final String name;
  final int amount;
  final double alcoholAmount;
}

class CreateDrinkingHistoryState extends Equatable {
  const CreateDrinkingHistoryState({
    this.status = FormzStatus.pure,
    this.alcoholType = AlcoholType.soju,
    this.amount,
  });

  final FormzStatus status;
  final AlcoholType alcoholType;
  final double? amount;

  CreateDrinkingHistoryState copywith({
    FormzStatus? status,
    AlcoholType? alcoholType,
    double? amount,
  }) =>
      CreateDrinkingHistoryState(
        status: status ?? this.status,
        alcoholType: alcoholType ?? this.alcoholType,
        amount: amount ?? this.amount,
      );

  @override
  List<Object?> get props => [
        status,
        alcoholType,
        amount,
      ];
}
