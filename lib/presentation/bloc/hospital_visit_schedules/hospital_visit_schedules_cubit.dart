// Dart imports:
import 'dart:async';

// Package imports:
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/delete_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedules.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/toggle_hospital_visit_schedule_push.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/on_user_cubit.dart';

part 'hospital_visit_schedules_state.dart';

class HospitalVisitSchedulesCubit extends Cubit<HospitalVisitSchedulesState>
    implements IonUserCubit {
  HospitalVisitSchedulesCubit({
    required this.updateHospitalVisitSchedule,
    required this.getHospitalVisitSchedulesStream,
    required this.toggleHospitalVisitSchedulePush,
    required this.deleteHospitalVisitSchedule,
  }) : super(const HospitalVisitSchedulesInitial());

  final GetHospitalVisitSchedulesStream getHospitalVisitSchedulesStream;
  final UpdateHospitalVisitSchedule updateHospitalVisitSchedule;
  final ToggleHospitalVisitSchedulePush toggleHospitalVisitSchedulePush;
  final DeleteHospitalVisitSchedule deleteHospitalVisitSchedule;

  StreamSubscription<List<HospitalVisitSchedule>>?
      hospitalVisitSchedulesSubscription;

  Future<void> loadSchedules() async {
    emit(const HospitalVisitSchedulesLoadInProgress());

    final either = await getHospitalVisitSchedulesStream.call(null);

    either.fold(
      (l) => emit(const HospitalVisitSchedulesLoadFailure()),
      (r) {
        hospitalVisitSchedulesSubscription?.cancel();
        hospitalVisitSchedulesSubscription = r.listen(
          (hospitalVisitSchedules) => emit(
            HospitalVisitSchedulesLoadSuccess(
              hospitalVisitSchedules: List<HospitalVisitSchedule>.from(
                <HospitalVisitSchedule>[
                  ...hospitalVisitSchedules.where(
                    (element) => element.visitedAt == null,
                  )..sorted(
                      (prev, curr) =>
                          curr.reservedAt.compareTo(prev.reservedAt),
                    ),
                  ...hospitalVisitSchedules.where(
                    (element) => element.visitedAt != null,
                  )..sorted(
                      (prev, curr) =>
                          curr.reservedAt.compareTo(prev.reservedAt),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> doneSchedule(String scheduleId) async {
    await updateHospitalVisitSchedule.call(
      HospitalVisitSchedulesCompanion(
        id: Value(scheduleId),
        visitedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteSchedule(String scheduleId) async {
    await deleteHospitalVisitSchedule.call(scheduleId);
  }

  Future<void> togglePush(String id) async {
    final schedules = _schedules;
    final index = schedules.indexWhere((element) => element.id == id);

    if (index == -1) return;

    final push = !(schedules[index].afterPush || schedules[index].beforePush);

    await toggleHospitalVisitSchedulePush.call(
      HospitalVisitSchedulesCompanion(
        id: Value(id),
        beforePush: Value(push),
        afterPush: Value(push),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> visit(String id) async {
    final schedules = _schedules;
    final index = schedules.indexWhere((element) => element.id == id);

    if (index == -1) return;

    final visitedAt = DateTime.now();

    await updateHospitalVisitSchedule.call(
      HospitalVisitSchedulesCompanion(
        id: Value(id),
        visitedAt: Value(visitedAt),
        updatedAt: Value(visitedAt),
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
