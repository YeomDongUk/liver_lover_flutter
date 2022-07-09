import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_notification/medication_notification_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/datasources/local/prescription/prescription_local_data_source.dart';
import 'package:yak/data/models/prescription/prescription_write_response.dart';

void main() {
  late final PrescriptionLocalDataSourceImpl prescriptionLocalDataSourceImpl;
  late final AppDatabase attachedDatabase;
  late final MedicationInformationLocalDataSourceImpl
      medicationInformationLocalDataSourceImpl;
  late final MedicationScheduleLocalDataSourceImpl
      medicationScheduleLocalDataSourceImpl;
  late final MedicationNotificationLocalDataSourceImpl
      medicationNotificationLocalDataSourceImpl;

  setUpAll(() {
    attachedDatabase = AppDatabase(
      LazyDatabase(
        () => NativeDatabase.memory(logStatements: false),
      ),
    );

    medicationInformationLocalDataSourceImpl =
        MedicationInformationLocalDataSourceImpl(attachedDatabase);
    medicationScheduleLocalDataSourceImpl =
        MedicationScheduleLocalDataSourceImpl(
      attachedDatabase,
    );
    medicationNotificationLocalDataSourceImpl =
        MedicationNotificationLocalDataSourceImpl(
      attachedDatabase,
      LocalNotificationImpl(),
    );

    prescriptionLocalDataSourceImpl = PrescriptionLocalDataSourceImpl(
      attachedDatabase,
      medicationInformationLocalDataSourceImpl,
      medicationScheduleLocalDataSourceImpl,
      medicationNotificationLocalDataSourceImpl,
    );
  });

  group('curd test', () {
    test('get overviews before create', () async {
      final overviews = await prescriptionLocalDataSourceImpl
          .getPrescriptionOverviews('test');

      expect(overviews.isEmpty, true);
    });

    test('create prescription', () async {
      final response = await prescriptionLocalDataSourceImpl.createPrescription(
        prescriptionsCompanion: PrescriptionsCompanion.insert(
          id: const Value('prescriptionId'),
          userId: 'test',
          doctorName: '테스트 닥터',
          prescribedAt: DateTime(2022, 6, 24),
          medicationStartAt: DateTime(2022, 6, 24),
          medicationEndAt: DateTime(2022, 6, 24).add(const Duration(days: 3)),
          push: const Value(true),
          beforePush: const Value(true),
          afterPush: const Value(true),
        ),
        medicationInformationsCompanions: List.generate(
          5,
          (index) => MedicationInformationsCompanion.insert(
            prescriptionId: 'prescriptionId',
            pillId: '$index',
            dayDuration: 3,
            takeCount: 2,
            moring: const Value(7),
            afternoon: const Value(11),
            evening: const Value(18),
            night: const Value(22),
          ),
        ),
      );
      print(response.medicationInformationModels);
      // 3일동안 4번 먹는데 *2배가 잇어야함

      expect(response, const TypeMatcher<PrescriptionWriteResponse>());
    });

    test('get overviews after create', () async {
      final overviews = await prescriptionLocalDataSourceImpl
          .getPrescriptionOverviews('test');
      expect(overviews.isNotEmpty, true);
    });

    test('get notifications', () async {
      final notifications = await (prescriptionLocalDataSourceImpl
              .select(
        attachedDatabase.medicationNotifications,
      )
              .join([
        leftOuterJoin(
          attachedDatabase.medicationSchedules,
          attachedDatabase.medicationSchedules.id.equalsExp(
            attachedDatabase.medicationNotifications.medicationScheduleId,
          ),
        ),
        leftOuterJoin(
          attachedDatabase.prescriptions,
          attachedDatabase.prescriptions.id
              .equalsExp(attachedDatabase.medicationSchedules.prescriptionId),
        ),
      ])
            ..where(attachedDatabase.prescriptions.id.equals('prescriptionId')))
          .get();

      print(notifications.length);

      expect(notifications.isNotEmpty, true);
    });
  });
}
