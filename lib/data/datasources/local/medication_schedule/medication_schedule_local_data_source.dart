// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';
import 'package:yak/data/datasources/local/notification_schedule/notification_schedule_local_data_source.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_update_input.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';

abstract class MedicationScheduleLocalDataSource {
  Stream<List<MedicationScheduleModel>> getMedicationSchedulesStream({
    required String userId,
  });

  MedicationScheduleModel? createMedicationSchdule({
    required MedicationScheduleModel medicationScheduleModel,
  });

  MedicationScheduleModel? updateMedicationSchedule({
    required String id,
    required MedicationScheduleUpdateInput medicationScheduleUpdateInput,
  });

  Future<void> updateMedicationSchedulesPush({
    required String userId,
    required List<String> ids,
    required bool push,
  });

  Future<void> updateMedicationSchedulesPushByPrescriptionId({
    required String userId,
    required String prescriptionId,
    required bool push,
  });

  // List<DailyMedicationScheduleStatus> getDailyMedicationScheduleStatus({
  //   required String userId,
  // });

  void medicationAll({
    required String userId,
    required DateTime reservedAt,
  });

  void medicate({
    required String userId,
    required String scheduleId,
  });

  Future<MedicationSchedulesGroup> getMedicationGroup({
    required DateTime reservedAt,
  });
}

class MedicationScheduleLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements MedicationScheduleLocalDataSource {
  MedicationScheduleLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
    required this.notificationScheduleLocalDataSource,
  }) : super(attachedDatabase);

  final NotificationScheduleLocalDataSource notificationScheduleLocalDataSource;

  @override
  Stream<List<MedicationScheduleModel>> getMedicationSchedulesStream({
    required String userId,
  }) {
    return (select(medicationSchedules).join([
      leftOuterJoin(
        medicationInformations,
        medicationInformations.id
            .equalsExp(medicationSchedules.medicationInformationId),
        useColumns: false,
      ),
      leftOuterJoin(
        prescriptions,
        prescriptions.id.equalsExp(
          medicationInformations.prescriptionId,
        ),
        useColumns: false,
      ),
    ])
          ..orderBy([
            OrderingTerm.asc(medicationSchedules.reservedAt),
          ])
          ..where(prescriptions.userId.equals(userId)))
        .watch()
        .map(
          (results) =>
              results.map((e) => e.readTable(medicationSchedules)).toList(),
        );
  }

  @override
  MedicationScheduleModel? createMedicationSchdule({
    required MedicationScheduleModel medicationScheduleModel,
  }) {
    // TODO: implement createMedicationSchdule
    throw UnimplementedError();
  }

  @override
  Future<MedicationSchedulesGroup> getMedicationGroup({
    required DateTime reservedAt,
  }) {
    // TODO: implement getMedicationGroup
    throw UnimplementedError();
  }

  @override
  Stream<Future<List<MedicationSchedulesGroup>>>
      getMedicationSchedulesGroupsStream({
    required String userId,
    required DateTime date,
  }) {
    // TODO: implement getMedicationSchedulesGroupsStream
    throw UnimplementedError();
  }

  @override
  void medicate({required String userId, required String scheduleId}) {
    // TODO: implement medicate
  }

  @override
  void medicationAll({required String userId, required DateTime reservedAt}) {
    // TODO: implement medicationAll
  }

  @override
  MedicationScheduleModel? updateMedicationSchedule({
    required String id,
    required MedicationScheduleUpdateInput medicationScheduleUpdateInput,
  }) {
    // TODO: implement updateMedicationSchedule
    throw UnimplementedError();
  }

  @override
  Future<List<MedicationScheduleModel>> updateMedicationSchedulesPush({
    required String userId,
    required List<String> ids,
    required bool push,
  }) {
    // TODO: implement updateMedicationSchedulesPush
    throw UnimplementedError();
  }

  @override
  Future<void> updateMedicationSchedulesPushByPrescriptionId({
    required String userId,
    required String prescriptionId,
    required bool push,
  }) {
    // TODO: implement updateMedicationSchedulesPushByPrescriptionId
    throw UnimplementedError();
  }
}
