import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/usecases/pill/search_pills.dart';

part 'pill_search_state.dart';

class PillSearchCubit extends Cubit<PillSearchState> {
  PillSearchCubit({required this.searchPills}) : super(const PillSearchState());
  final SearchPills searchPills;
  Future<void> search(String name) async {
    try {
      emit(const PillSearchState(status: FormzStatus.submissionInProgress));

      final searchPillsResult = await searchPills.call(name);

      emit(
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
    } catch (e) {
      return emit(
        const PillSearchState(
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }
}
