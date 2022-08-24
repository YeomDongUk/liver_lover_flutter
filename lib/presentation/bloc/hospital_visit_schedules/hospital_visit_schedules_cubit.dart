// Package imports:
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/delete_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedules.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/toggle_hospital_visit_schedule_push.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/on_user_cubit.dart';

part 'hospital_visit_schedules_state.dart';

class HospitalVisitSchedulesCubit extends Cubit<HospitalVisitSchedulesState>
    implements IonUserCubit {
  HospitalVisitSchedulesCubit({
    required this.updateHospitalVisitSchedule,
    required this.getHospitalVisitSchedule,
    required this.getHospitalVisitSchedules,
    required this.toggleHospitalVisitSchedulePush,
    required this.deleteHospitalVisitSchedule,
  }) : super(const HospitalVisitSchedulesInitial());

  final GetHospitalVisitSchedule getHospitalVisitSchedule;
  final GetHospitalVisitSchedules getHospitalVisitSchedules;
  final UpdateHospitalVisitSchedule updateHospitalVisitSchedule;
  final ToggleHospitalVisitSchedulePush toggleHospitalVisitSchedulePush;
  final DeleteHospitalVisitSchedule deleteHospitalVisitSchedule;

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

  Future<void> doneSchedule(String scheduleId) async {}

  Future<void> deleteSchedule(String scheduleId) async {
    await deleteHospitalVisitSchedule.call(scheduleId);
    onDeleteSchedule(scheduleId);
  }

  Future<void> togglePush(String id) async {
    final schedules = _schedules;
    final index = schedules.indexWhere((element) => element.id == id);

    if (index == -1) return;

    final either = await toggleHospitalVisitSchedulePush.call(
      HospitalVisitSchedulesCompanion(
        id: Value(id),
        push: Value(!state.hospitalVisitSchedules[index].push),
      ),
    );

    emit(
      either.fold(
        (l) => state,
        (r) => HospitalVisitSchedulesScheduleUpdated(
          hospitalVisitSchedules: schedules..[index] = r,
        ),
      ),
    );
  }

  Future<void> visit(String id) async {
    final schedules = _schedules;
    final index = schedules.indexWhere((element) => element.id == id);

    if (index == -1) return;

    final visitedAt = DateTime.now();

    final either = await updateHospitalVisitSchedule.call(
      HospitalVisitSchedulesCompanion(
        id: Value(id),
        visitedAt: Value(visitedAt),
        updatedAt: Value(visitedAt),
      ),
    );

    emit(
      either.fold(
        (l) => state,
        (r) => HospitalVisitSchedulesScheduleUpdated(
          hospitalVisitSchedules: schedules..[index] = r,
        ),
      ),
    );
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
