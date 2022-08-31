// Package imports:
import 'package:drift/drift.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';
import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/models/prescription/prescription_create_input.dart';
import 'package:yak/data/models/prescription/prescription_notification_update_input.dart';
import 'package:yak/data/models/prescription/prescription_update_input.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';

// Project imports:

abstract class PrescriptionLocalDataSource {
  Stream<Future<List<Prescription>>> getPrescriptions({required String userId});

  Future<PrescriptionModel> createPrescription({
    required String userId,
    required PrescriptionCreateInput createInput,
  });

  Future<PrescriptionModel> updatePrescription({
    required String userId,
    required PrescriptionUpdateInput updateInput,
  });

  Future<void> togglePrescriptionNotificaiton({
    required String userId,
    required PrescriptionNotificationUpdateInput
        prescriptionNotificationUpdateInput,
  });
}

class PrescriptionLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements PrescriptionLocalDataSource {
  PrescriptionLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
  }) : super(attachedDatabase);

  MedicationInformationLocalDataSource
      get medicationInformationLocalDataSource =>
          KiwiContainer().resolve<MedicationInformationLocalDataSource>();

  MedicationScheduleLocalDataSource get medicationScheduleLocalDataSource =>
      KiwiContainer().resolve<MedicationScheduleLocalDataSource>();

  @override
  Future<PrescriptionModel> createPrescription({
    required String userId,
    required PrescriptionCreateInput createInput,
  }) {
    // TODO: implement createPrescription
    throw UnimplementedError();
  }

  @override
  Stream<Future<List<Prescription>>> getPrescriptions({
    required String userId,
  }) {
    // TODO: implement getPrescriptions
    throw UnimplementedError();
  }

  @override
  Future<void> togglePrescriptionNotificaiton({
    required String userId,
    required PrescriptionNotificationUpdateInput
        prescriptionNotificationUpdateInput,
  }) {
    // TODO: implement togglePrescriptionNotificaiton
    throw UnimplementedError();
  }

  @override
  Future<PrescriptionModel> updatePrescription({
    required String userId,
    required PrescriptionUpdateInput updateInput,
  }) {
    // TODO: implement updatePrescription
    throw UnimplementedError();
  }
}
