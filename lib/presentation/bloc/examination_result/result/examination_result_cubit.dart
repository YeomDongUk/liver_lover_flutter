// Package imports:
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/examination_result/examination_result.dart';
import 'package:yak/domain/usecases/examination_result/upsert_examination_result.dart';

part 'examination_result_state.dart';

class ExaminationResultCubit extends Cubit<ExaminationResultState> {
  ExaminationResultCubit({required this.upsertExaminationResult})
      : super(const ExaminationResultState());

  final UpsertExaminationResult upsertExaminationResult;
  late DateTime _selectedDate;
  void updateExaminationResult({
    required DateTime date,
    required ExaminationResult? examinationResult,
  }) {
    _selectedDate = date;
    emit(
      ExaminationResultState(
        examinationResult: examinationResult,
      ),
    );
  }

  Future<void> updatePlatelet(double platelet) async {
    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.inProgress,
        examinationResult: state.examinationResult?.copyWith(
          platelet: platelet,
        ),
      ),
    );

    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        platelet: Value((platelet * 1000).toInt()),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateAst(double ast) async {
    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.inProgress,
        examinationResult: state.examinationResult?.copyWith(
          ast: ast,
        ),
      ),
    );
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        ast: Value((ast * 1000).toInt()),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateAlt(double alt) async {
    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.inProgress,
        examinationResult: state.examinationResult?.copyWith(
          alt: alt,
        ),
      ),
    );
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        alt: Value((alt * 1000).toInt()),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateGgt(double ggt) async {
    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.inProgress,
        examinationResult: state.examinationResult?.copyWith(
          ggt: ggt,
        ),
      ),
    );
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        ggt: Value((ggt * 1000).toInt()),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateBilirubin(double bilirubin) async {
    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.inProgress,
        examinationResult: state.examinationResult?.copyWith(
          bilirubin: bilirubin,
        ),
      ),
    );
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        bilirubin: Value((bilirubin * 1000).toInt()),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateAlbumin(double albumin) async {
    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.inProgress,
        examinationResult: state.examinationResult?.copyWith(
          albumin: albumin,
        ),
      ),
    );
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        albumin: Value((albumin * 1000).toInt()),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateAfp(double? afp) async {
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        afp: Value(
          afp == null ? null : (afp * 1000).toInt(),
        ),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateHbvDna(double? hbvDna) async {
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        hbvDna: Value(
          hbvDna == null ? null : (hbvDna * 1000).toInt(),
        ),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateHcvRna(double? hcvRna) async {
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        hcvRna: Value(
          hcvRna == null ? null : (hcvRna * 1000).toInt(),
        ),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateBenignTumor(
    String? benignTumor,
  ) async {
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        benignTumor: Value(benignTumor),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  Future<void> updateDangerousNodule(String? dangerousNodule) async {
    final either = await upsertExaminationResult.call(
      _companion.copyWith(
        dangerousNodule: Value(dangerousNodule),
      ),
    );

    emit(
      ExaminationResultState(
        status: ExaminationResultStatus.done,
        examinationResult: either.fold(
          (l) => null,
          (r) => r,
        ),
      ),
    );
  }

  ExaminationResultsCompanion get _companion => ExaminationResultsCompanion(
        platelet: state.examinationResult?.platelet == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.platelet == null
                    ? null
                    : (state.examinationResult!.platelet! * 1000).toInt(),
              ),
        ast: state.examinationResult?.ast == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.ast == null
                    ? null
                    : (state.examinationResult!.ast! * 1000).toInt(),
              ),
        alt: state.examinationResult?.alt == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.alt == null
                    ? null
                    : (state.examinationResult!.alt! * 1000).toInt(),
              ),
        ggt: state.examinationResult?.ggt == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.ggt == null
                    ? null
                    : (state.examinationResult!.ggt! * 1000).toInt(),
              ),
        bilirubin: state.examinationResult?.bilirubin == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.bilirubin == null
                    ? null
                    : (state.examinationResult!.bilirubin! * 1000).toInt(),
              ),
        albumin: state.examinationResult?.albumin == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.albumin == null
                    ? null
                    : (state.examinationResult!.albumin! * 1000).toInt(),
              ),
        afp: state.examinationResult?.afp == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.afp == null
                    ? null
                    : (state.examinationResult!.afp! * 1000).toInt(),
              ),
        hbvDna: state.examinationResult?.hbvDna == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.hbvDna == null
                    ? null
                    : (state.examinationResult!.hbvDna! * 1000).toInt(),
              ),
        hcvRna: state.examinationResult?.hcvRna == null
            ? const Value.absent()
            : Value(
                state.examinationResult!.hcvRna == null
                    ? null
                    : (state.examinationResult!.hcvRna! * 1000).toInt(),
              ),
        benignTumor: state.examinationResult?.benignTumor == null
            ? const Value.absent()
            : Value(state.examinationResult!.benignTumor),
        dangerousNodule: state.examinationResult?.dangerousNodule == null
            ? const Value.absent()
            : Value(state.examinationResult!.dangerousNodule),
        date: Value(_selectedDate),
      );
}
