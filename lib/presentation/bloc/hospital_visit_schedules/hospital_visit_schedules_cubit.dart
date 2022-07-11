import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedules.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/on_user_state.dart';

part 'hospital_visit_schedules_state.dart';

class HospitalVisitSchedulesCubit extends Cubit<HospitalVisitSchedulesState>
    implements IonUserState {
  HospitalVisitSchedulesCubit({
    required this.updateHospitalVisitSchedule,
    required this.getHospitalVisitSchedule,
    required this.getHospitalVisitSchedules,
  }) : super(const HospitalVisitSchedulesInitial());

  final GetHospitalVisitSchedule getHospitalVisitSchedule;
  final GetHospitalVisitSchedules getHospitalVisitSchedules;
  final UpdateHospitalVisitSchedule updateHospitalVisitSchedule;

  Future<void> loadSchedules() async {
    emit(const HospitalVisitSchedulesLoadInProgress());

    try {
      final result = await getHospitalVisitSchedules.call(false);

      emit(
        result.fold(
          (l) => const HospitalVisitSchedulesLoadFailure(),
          (r) => HospitalVisitSchedulesLoadSuccess(hospitalVisitSchedules: r),
        ),
      );
    } catch (e) {
      emit(const HospitalVisitSchedulesLoadFailure());
    }
  }

  void onAddSchedule(HospitalVisitSchedule schedule) {
    final schedules = _schedules
      ..add(schedule)
      ..sort((prev, curr) => prev.reservedAt.compareTo(curr.reservedAt));

    emit(
      HospitalVisitSchedulesScheduleAdded(
        hospitalVisitSchedules: schedules,
      ),
    );
  }

  void onUpdateSchedule(HospitalVisitSchedule schedule) {
    final schedules = _schedules
      ..removeWhere((s) => s.id == schedule.id)
      ..add(schedule)
      ..sort((prev, curr) => prev.reservedAt.compareTo(curr.reservedAt));

    emit(
      HospitalVisitSchedulesScheduleUpdated(
        hospitalVisitSchedules: schedules,
      ),
    );
  }

  void onDeleteSchedule(String id) {
    final schedules = _schedules..removeWhere((s) => s.id == id);

    emit(
      HospitalVisitSchedulesScheduleDeleted(
        hospitalVisitSchedules: schedules,
      ),
    );
  }

  Future<void> visit(String id) async {
    final schedules = _schedules;
    final index = schedules.indexWhere((element) => element.id == id);
    final oldState = state;

    if (index == -1) return;

    // schedules[index] = schedules[index].copyWith(visitedAt: DateTime.now());

    try {
      await updateHospitalVisitSchedule.call(
        HospitalVisitSchedulesCompanion(
          id: Value(id),
          visitedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
      emit(
        HospitalVisitSchedulesScheduleUpdated(
          hospitalVisitSchedules: schedules..removeAt(index),
        ),
      );
    } catch (e) {
      emit(oldState);
    }
  }

  @override
  void onLogout() => emit(const HospitalVisitSchedulesInitial());

  HospitalVisitSchedule getSchedule(String id) {
    final schedule = state.hospitalVisitSchedules
        .firstWhereOrNull((element) => element.id == id);

    return schedule!;
  }

  List<HospitalVisitSchedule> get _schedules =>
      List<HospitalVisitSchedule>.from(
        state.hospitalVisitSchedules,
      );
}
