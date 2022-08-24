// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/usecases/pill/search_pills.dart';

part 'pill_search_state.dart';

class PillSearchCubit extends Cubit<PillSearchState> {
  PillSearchCubit({
    required this.searchPills,
  }) : super(const PillSearchState());
  final SearchPills searchPills;

  Future<void> search(String name) async {
    emit(const PillSearchState(status: FormzStatus.submissionInProgress));

    final searchPillsResult = await searchPills.call(name);

    return isClosed
        ? null
        : emit(
            searchPillsResult.fold(
              (l) => const PillSearchState(
                status: FormzStatus.submissionFailure,
              ),
              (r) => PillSearchState(
                pills: r,
                status: FormzStatus.submissionSuccess,
              ),
            ),
          );
  }
}
