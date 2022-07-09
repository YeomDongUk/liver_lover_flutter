part of 'pill_search_cubit.dart';

class PillSearchState extends Equatable {
  const PillSearchState({
    this.status = FormzStatus.pure,
    this.pills = const [],
    // this.pillName = const Name.pure(),
  });
  final FormzStatus status;
  // final Name pillName;

  final List<Pill> pills;

  @override
  List<Object> get props => [
        status,
        pills,
        // pillName,
      ];
}
